package com.example.cinema.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.cinema.dto.MenuDTO;
import com.example.cinema.vo.UserDetailVO;
import com.example.cinema.entity.Menu;
import com.example.cinema.entity.RoleMenu;
import com.example.cinema.mapper.MenuMapper;
import com.example.cinema.mapper.RoleMenuMapper;
import com.example.cinema.service.MenuService;
import com.example.cinema.utils.BeanCopyUtil;
import com.example.cinema.vo.LabelOptionVO;
import com.example.cinema.vo.MenuVO;
import com.example.cinema.vo.UserMenuVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements MenuService {

    @Autowired
    private RoleMenuMapper roleMenuMapper;

    @Override
    public List<MenuVO> menuList(String keywords) {
        // 查询菜单数据
        List<Menu> menuList = baseMapper.selectList(new LambdaQueryWrapper<Menu>()
                .like(StringUtils.isNotBlank(keywords), Menu::getName, keywords));
        // 获取一级菜单
        List<Menu> catalogList = getCatalogListByMenuList(menuList);
        // 根据一级菜单分类
        Map<Integer, List<Menu>> childrenMap = groupingByMenuParentId(menuList);
        // 组装二级菜单
        List<MenuVO> menuVOList = catalogList.stream().map(item -> {
            MenuVO menuDTO = BeanCopyUtil.copyObject(item, MenuVO.class);
            // 获取一级目录下的菜单排序
            List<MenuVO> list = BeanCopyUtil.copyList(childrenMap.get(item.getId()), MenuVO.class).stream()
                    .sorted(Comparator.comparing(MenuVO::getOrderNum))
                    .collect(Collectors.toList());
            menuDTO.setChildren(list);
            childrenMap.remove(item.getId());
            return menuDTO;
        }).sorted(Comparator.comparing(MenuVO::getOrderNum)).collect(Collectors.toList());
        // 若还有菜单未取出则拼接
        if (CollectionUtils.isNotEmpty(childrenMap)) {
            List<Menu> childrenList = new ArrayList<>();
            childrenMap.values().forEach(childrenList::addAll);
            List<MenuVO> childrenDTOList = childrenList.stream()
                    .map(item -> BeanCopyUtil.copyObject(item, MenuVO.class))
                    .sorted(Comparator.comparing(MenuVO::getOrderNum))
                    .collect(Collectors.toList());
            menuVOList.addAll(childrenDTOList);
        }
        return menuVOList;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveOrUpdateMenu(MenuDTO menuDTO) {
        Menu menu = BeanCopyUtil.copyObject(menuDTO, Menu.class);
        this.saveOrUpdate(menu);
    }

    @Override
    public void deleteMenu(Integer menuId) {
        // 查询是否有角色关联
        Long count = roleMenuMapper.selectCount(new LambdaQueryWrapper<RoleMenu>()
                .eq(RoleMenu::getMenuId, menuId));
        if (count > 0) {
            throw new RuntimeException("菜单下有角色关联");
        }
        // 查询子菜单
        List<Integer> menuIdList = baseMapper.selectList(new LambdaQueryWrapper<Menu>()
                        .select(Menu::getId)
                        .eq(Menu::getParentId, menuId))
                .stream()
                .map(Menu::getId)
                .collect(Collectors.toList());
        menuIdList.add(menuId);
        baseMapper.deleteBatchIds(menuIdList);
    }

    @Override
    public List<LabelOptionVO> menuOptionList() {
        // 查询菜单数据
        List<Menu> menuList = baseMapper.selectList(new LambdaQueryWrapper<Menu>()
                .select(Menu::getId, Menu::getName, Menu::getParentId, Menu::getOrderNum));
        // 获取一级菜单
        List<Menu> catalogList = getCatalogListByMenuList(menuList);
        // 根据一级菜单分类
        Map<Integer, List<Menu>> childrenMap = groupingByMenuParentId(menuList);
        // 组装目录菜单数据
        return catalogList.stream().map(item -> {
            // 获取目录下的菜单排序
            List<LabelOptionVO> list = new ArrayList<>();
            List<Menu> children = childrenMap.get(item.getId());
            if (CollectionUtils.isNotEmpty(children)) {
                list = children.stream()
                        .sorted(Comparator.comparing(Menu::getOrderNum))
                        .map(menu -> LabelOptionVO.builder()
                                .id(menu.getId())
                                .label(menu.getName())
                                .build())
                        .collect(Collectors.toList());
            }
            return LabelOptionVO.builder()
                    .id(item.getId())
                    .label(item.getName())
                    .children(list)
                    .build();
        }).collect(Collectors.toList());
    }

    @Override
    public List<UserMenuVO> userMenuList() {
        UserDetailVO principal = (UserDetailVO) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();
        // 查询用户菜单信息
        List<Menu> menuList = baseMapper.listMenusByUserId(principal.getId());
        // 获取一级菜单
        List<Menu> catalogList = getCatalogListByMenuList(menuList);
        // 根据一级菜单分类
        Map<Integer, List<Menu>> childrenMap = groupingByMenuParentId(menuList);
        // 转换前端菜单格式
        return catalogList.stream().map(item -> {
            // 获取目录
            UserMenuVO userMenuVO = new UserMenuVO();
            List<UserMenuVO> list = new ArrayList<>();
            // 获取目录下的子菜单
            List<Menu> children = childrenMap.get(item.getId());
            if (CollectionUtils.isNotEmpty(children)) {
                // 多级菜单处理
                userMenuVO = BeanCopyUtil.copyObject(item, UserMenuVO.class);
                list = children.stream()
                        .sorted(Comparator.comparing(Menu::getOrderNum))
                        .map(menu -> {
                            UserMenuVO dto = BeanCopyUtil.copyObject(menu, UserMenuVO.class);
                            dto.setHidden(menu.getIsHidden().equals(1));
                            return dto;
                        })
                        .collect(Collectors.toList());
            } else {
                // 一级菜单处理
                userMenuVO.setPath(item.getPath());
                userMenuVO.setComponent("Layout");
                list.add(UserMenuVO.builder()
                        .path("")
                        .name(item.getName())
                        .icon(item.getIcon())
                        .component(item.getComponent())
                        .build());
            }
            userMenuVO.setHidden(item.getIsHidden().equals(1));
            userMenuVO.setChildren(list);
            return userMenuVO;
        }).collect(Collectors.toList());
    }

    private List<Menu> getCatalogListByMenuList(List<Menu> menuList) {
        return menuList.stream()
                .filter(item -> Objects.isNull(item.getParentId()))
                .sorted(Comparator.comparing(Menu::getOrderNum))
                .collect(Collectors.toList());
    }

    private Map<Integer, List<Menu>> groupingByMenuParentId(List<Menu> menuList) {
        return menuList.stream()
                .filter(item -> Objects.nonNull(item.getParentId()))
                .collect(Collectors.groupingBy(Menu::getParentId));
    }
}
