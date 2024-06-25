package com.example.cinema.controller;


import com.example.cinema.annotation.OptLog;
import com.example.cinema.dto.MenuDTO;
import com.example.cinema.service.MenuService;
import com.example.cinema.vo.LabelOptionVO;
import com.example.cinema.vo.MenuVO;
import com.example.cinema.vo.Response;
import com.example.cinema.vo.UserMenuVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import kotlin.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

import static com.example.cinema.constant.OptTypeConst.REMOVE;
import static com.example.cinema.constant.OptTypeConst.SAVE_OR_UPDATE;

@Api(tags = "菜单模块")
@RestController
@RequestMapping("/menu")
public class MenuController {
    @Autowired
    private MenuService menuService;

    @GetMapping
    @ApiOperation(value = "查看菜单列表")
    public Response<List<MenuVO>> listMenus(String keywords) {
        return Response.success(menuService.menuList(keywords));
    }

    @PostMapping
    @OptLog(optType = SAVE_OR_UPDATE)
    @ApiOperation(value = "新增或修改菜单")
    public Response<?> saveOrUpdateMenu(@Valid @RequestBody MenuDTO menuDTO) {
        menuService.saveOrUpdateMenu(menuDTO);
        return Response.success();
    }

    @ApiOperation(value = "删除菜单")
    @OptLog(optType = REMOVE)
    @DeleteMapping("/{menuId}")
    public Response<?> deleteMenu(@PathVariable Integer menuId){
        menuService.deleteMenu(menuId);
        return Response.success();
    }


    @ApiOperation(value = "查看角色菜单选项")
    @GetMapping("/role")
    public Response<List<LabelOptionVO>> menuOptionList() {
        return Response.success(menuService.menuOptionList());
    }


    @ApiOperation(value = "查看当前用户菜单")
    @GetMapping("/user")
    public Response<List<UserMenuVO>> userMenuList() {
        return Response.success(menuService.userMenuList());
    }
}
