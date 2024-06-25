package com.example.cinema.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.cinema.dto.ResourceDTO;
import com.example.cinema.entity.Resource;
import com.example.cinema.entity.RoleResource;
import com.example.cinema.handler.FilterInvocationSecurityMetadataSourceImpl;
import com.example.cinema.mapper.ResourceMapper;
import com.example.cinema.mapper.RoleResourceMapper;
import com.example.cinema.service.ResourceService;
import com.example.cinema.utils.BeanCopyUtil;
import com.example.cinema.vo.LabelOptionVO;
import com.example.cinema.vo.ResourceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class ResourceServiceImpl extends ServiceImpl<ResourceMapper, Resource> implements ResourceService {
    @Autowired
    private RoleResourceMapper roleResourceMapper;
    @Autowired
    private FilterInvocationSecurityMetadataSourceImpl filterInvocationSecurityMetadataSource;


    @Override
    public void saveOrUpdateResource(ResourceDTO resourceDTO) {
        Resource resource = BeanCopyUtil.copyObject(resourceDTO, Resource.class);
        this.saveOrUpdate(resource);
        // 重新加载角色资源信息
        filterInvocationSecurityMetadataSource.clearDataSource();
    }

    @Override
    public void deleteResource(Integer resourceId) {
        Long count = roleResourceMapper.selectCount(new LambdaQueryWrapper<RoleResource>()
                .eq(RoleResource::getResourceId, resourceId));
        if (count > 0) {
            throw new RuntimeException("该资源下存在角色");
        }
        // 删除子资源
        List<Integer> resourceIdList = baseMapper.selectList(new LambdaQueryWrapper<Resource>()
                        .select(Resource::getId).
                        eq(Resource::getParentId, resourceId))
                .stream()
                .map(Resource::getId)
                .collect(Collectors.toList());
        resourceIdList.add(resourceId);
        baseMapper.deleteBatchIds(resourceIdList);
    }

    @Override
    public List<ResourceVO> resourceList(String keywords) {
        // 查询资源列表
        List<Resource> resourceList = baseMapper.selectList(new LambdaQueryWrapper<Resource>()
                .like(StringUtils.isNotBlank(keywords), Resource::getResourceName, keywords));
        // 获取一级模块
        List<Resource> parentList = getParentResourceList(resourceList);
        // 根据一级模块Id分组
        Map<Integer, List<Resource>> childrenMap = getChildrenMap(resourceList);
        // 组装
        List<ResourceVO> resourceVOList = parentList.stream().map(item -> {
            ResourceVO resourceVO = BeanCopyUtil.copyObject(item, ResourceVO.class);
            List<ResourceVO> childrenList = BeanCopyUtil.copyList(childrenMap.get(item.getId()), ResourceVO.class);
            resourceVO.setChildren(childrenList);
            childrenMap.remove(item.getId());
            return resourceVO;
        }).collect(Collectors.toList());
        // 若还有资源未取出则拼接
        if (CollectionUtils.isNotEmpty(childrenMap)) {
            List<Resource> childrenList = new ArrayList<>();
            childrenMap.values().forEach(childrenList::addAll);
            List<ResourceVO> childrenDTOList = childrenList.stream()
                    .map(item -> BeanCopyUtil.copyObject(item, ResourceVO.class))
                    .collect(Collectors.toList());
            resourceVOList.addAll(childrenDTOList);
        }
        return resourceVOList;
    }

    @Override
    public List<LabelOptionVO> resourceOptionList() {
        // 查询资源列表
        List<Resource> resourceList = baseMapper.selectList(new LambdaQueryWrapper<Resource>()
                .select(Resource::getId, Resource::getResourceName, Resource::getParentId)
                .eq(Resource::getIsAnonymous, 0));
        // 获取所有模块
        List<Resource> parentList = getParentResourceList(resourceList);
        // 根据父id分组获取模块下的资源
        Map<Integer, List<Resource>> childrenMap = getChildrenMap(resourceList);
        // 组装父子数据
        return parentList.stream().map(item -> {
            List<LabelOptionVO> list = new ArrayList<>();
            List<Resource> children = childrenMap.get(item.getId());
            if (CollectionUtils.isNotEmpty(children)) {
                list = children.stream()
                        .map(resource -> LabelOptionVO.builder()
                                .id(resource.getId())
                                .label(resource.getResourceName())
                                .build())
                        .collect(Collectors.toList());
            }
            return LabelOptionVO.builder()
                    .id(item.getId())
                    .label(item.getResourceName())
                    .children(list)
                    .build();
        }).collect(Collectors.toList());
    }


    private List<Resource> getParentResourceList(List<Resource> resourceList) {
        return resourceList.stream()
                .filter(item -> item.getParentId() == null)
                .collect(Collectors.toList());
    }

    private Map<Integer, List<Resource>> getChildrenMap(List<Resource> resourceList) {
        return resourceList.stream()
                .filter(item -> item.getParentId() != null)
                .collect(Collectors.groupingBy(Resource::getParentId));
    }
}
