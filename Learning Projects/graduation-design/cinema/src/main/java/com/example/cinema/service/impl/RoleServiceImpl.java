package com.example.cinema.service.impl;


import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.cinema.constant.CommonConstant;
import com.example.cinema.dto.RoleAbleDTO;
import com.example.cinema.dto.RoleDTO;
import com.example.cinema.entity.Role;
import com.example.cinema.entity.RoleMenu;
import com.example.cinema.entity.RoleResource;
import com.example.cinema.handler.FilterInvocationSecurityMetadataSourceImpl;
import com.example.cinema.mapper.RoleMapper;
import com.example.cinema.mapper.RoleMenuMapper;
import com.example.cinema.mapper.RoleResourceMapper;
import com.example.cinema.service.RoleMenuService;
import com.example.cinema.service.RoleResourceService;
import com.example.cinema.service.RoleService;
import com.example.cinema.utils.BeanCopyUtil;
import com.example.cinema.utils.PageUtil;
import com.example.cinema.vo.PageResult;
import com.example.cinema.vo.RoleSimpleVO;
import com.example.cinema.vo.RoleVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {
    @Autowired
    private RoleResourceMapper roleResourceMapper;
    @Autowired
    private RoleMenuMapper roleMenuMapper;
    @Autowired
    private FilterInvocationSecurityMetadataSourceImpl filterInvocationSecurityMetadataSource;

    @Override
    public PageResult<RoleVO> getRolePage(String keywords) {
        Page<Role> page = new Page<>(PageUtil.getCurrent(), PageUtil.getSize());
        Page<Role> rolePage = baseMapper.selectPage(page, new LambdaQueryWrapper<Role>()
                .like(!StrUtil.isEmpty(keywords), Role::getName, keywords)
                .or()
                .like(!StrUtil.isEmpty(keywords), Role::getLabel, keywords));
        List<RoleVO> roleVOList = rolePage.getRecords().stream().map(role -> {
            RoleVO roleVO = BeanCopyUtil.copyObject(role, RoleVO.class);
            List<RoleResource> roleResources = roleResourceMapper.selectList(new LambdaQueryWrapper<RoleResource>()
                    .eq(RoleResource::getRoleId, role.getId()));
            List<Integer> resourceIdList = roleResources.stream()
                    .map(RoleResource::getResourceId)
                    .collect(Collectors.toList());
            List<RoleMenu> roleMenuList = roleMenuMapper.selectList(new LambdaQueryWrapper<RoleMenu>()
                    .eq(RoleMenu::getRoleId, role.getId()));
            List<Integer> menuIdList = roleMenuList.stream()
                    .map(RoleMenu::getMenuId)
                    .collect(Collectors.toList());
            roleVO.setResourceIdList(resourceIdList);
            roleVO.setMenuIdList(menuIdList);
            return roleVO;
        }).collect(Collectors.toList());
        return new PageResult<>(roleVOList, rolePage.getTotal());
    }

    @Override
    public List<RoleSimpleVO> getRoleList() {
        List<Role> roleList = baseMapper.selectList(new LambdaQueryWrapper<Role>()
                .eq(Role::getAbleFlag, true));
        return BeanCopyUtil.copyList(roleList, RoleSimpleVO.class);
    }

    @Override
    public Boolean updateAbleFlag(RoleAbleDTO roleAbleDTO) {
        List<Role> roleList = baseMapper.selectBatchIds(roleAbleDTO.getRoleIdList());
        roleList.forEach(role -> role.setAbleFlag(roleAbleDTO.getAbleFlag()));
        return updateBatchById(roleList);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean saveOrUpdateRole(RoleDTO roleDTO) {
        // 保存或更新角色信息
        Role role = BeanCopyUtil.copyObject(roleDTO, Role.class);
        this.saveOrUpdate(role);
        if (Objects.nonNull(roleDTO.getResourceIdList())) {
            // 更新角色资源关系 删除旧的关系
            roleResourceMapper.delete(new LambdaQueryWrapper<RoleResource>()
                    .eq(RoleResource::getRoleId, role.getId()));
            // 插入新关系
            roleDTO.getResourceIdList().forEach(resourceId -> {
                RoleResource roleResource = RoleResource.builder()
                        .roleId(role.getId())
                        .resourceId(resourceId)
                        .build();
                roleResourceMapper.insert(roleResource);
            });
            // 重新加载角色资源信息
            filterInvocationSecurityMetadataSource.clearDataSource();
        }
        if (Objects.nonNull(roleDTO.getMenuIdList())) {
            // 更新角色菜单关系 删除旧的关系
            roleMenuMapper.delete(new LambdaQueryWrapper<RoleMenu>()
                    .eq(RoleMenu::getRoleId, role.getId()));
            // 插入新关系
            roleDTO.getMenuIdList().forEach(menuId -> {
                RoleMenu roleMenu = RoleMenu.builder()
                        .roleId(role.getId())
                        .menuId(menuId)
                        .build();
                roleMenuMapper.insert(roleMenu);
            });
        }
        return true;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean deleteRole(List<Integer> roleIdList) {
        baseMapper.deleteBatchIds(roleIdList);
        roleIdList.forEach(roleId -> {
            roleMenuMapper.delete(new LambdaQueryWrapper<RoleMenu>()
                    .eq(RoleMenu::getRoleId, roleId));
            roleResourceMapper.delete(new LambdaQueryWrapper<RoleResource>()
                    .eq(RoleResource::getRoleId, roleId));
        });
        return true;
    }
}
