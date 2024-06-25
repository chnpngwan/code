package com.example.cinema.controller;

import com.example.cinema.annotation.OptLog;
import com.example.cinema.dto.RoleAbleDTO;
import com.example.cinema.dto.RoleDTO;
import com.example.cinema.service.RoleService;
import com.example.cinema.vo.PageResult;
import com.example.cinema.vo.Response;
import com.example.cinema.vo.RoleSimpleVO;
import com.example.cinema.vo.RoleVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.example.cinema.constant.OptTypeConst.*;

@Api(tags = "角色模块")
@RestController
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    @GetMapping
    @ApiOperation(value = "查看角色列表")
    public Response<PageResult<RoleVO>> getRolePage(String keywords) {
        return Response.success(roleService.getRolePage(keywords));
    }

    @GetMapping("/list")
    @ApiOperation(value = "查看所有角色")
    public Response<List<RoleSimpleVO>> getRoleList() {
        return Response.success(roleService.getRoleList());
    }

    @PostMapping
    @OptLog(optType = SAVE_OR_UPDATE)
    @ApiOperation(value = "新增或修改角色")
    public Response<?> saveOrUpdateRole(@RequestBody RoleDTO roleDTO) {
        if (roleService.saveOrUpdateRole(roleDTO)) {
            return Response.success();
        }
        return Response.failure();
    }

    @PutMapping("/able")
    @OptLog(optType = UPDATE)
    @ApiOperation(value = "禁用角色")
    public Response<?> updateAbleFlag(@RequestBody RoleAbleDTO roleAbleDTO) {
        if (roleService.updateAbleFlag(roleAbleDTO)) {
            return Response.success();
        }
        return Response.failure();
    }

    @DeleteMapping
    @OptLog(optType = REMOVE)
    @ApiOperation(value = "删除角色")
    public Response<?> deleteRoleByIds(@RequestBody List<Integer> ids) {
        if (roleService.deleteRole(ids)) {
            return Response.success();
        }
        return Response.failure();
    }

}
