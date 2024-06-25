package com.example.cinema.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.cinema.dto.MenuDTO;
import com.example.cinema.entity.Menu;
import com.example.cinema.vo.LabelOptionVO;
import com.example.cinema.vo.MenuVO;
import com.example.cinema.vo.UserMenuVO;

import java.util.List;

public interface MenuService extends IService<Menu> {
    List<MenuVO> menuList(String keywords);
    void saveOrUpdateMenu(MenuDTO menuDTO);
    void deleteMenu(Integer menuId);
    List<LabelOptionVO> menuOptionList();
    List<UserMenuVO> userMenuList();
}
