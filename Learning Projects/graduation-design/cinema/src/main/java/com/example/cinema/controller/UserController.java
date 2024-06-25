package com.example.cinema.controller;

import com.example.cinema.annotation.OptLog;
import com.example.cinema.dto.*;
import com.example.cinema.service.UserService;
import com.example.cinema.vo.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.example.cinema.constant.OptTypeConst.*;

@Api(tags = "用户模块")
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping
    @ApiOperation(value = "查看用户列表")
    public Response<PageResult<UserBackVO>> getUserList(String keywords) {
        return Response.success(userService.getUserList(keywords));
    }

    @GetMapping("/info")
    @ApiOperation(value = "查看用户详情")
    public Response<UserInfoVO> getUserInfo(Integer userId) {
        return Response.success(userService.getUserInfo(userId));
    }

    @GetMapping("/online")
    @ApiOperation(value = "查看在线用户")
    public Response<PageResult<UserOnlineVO>> onlineUserList(String keywords) {
        return Response.success(userService.onlineUserList(keywords));
    }

    @PostMapping("/register")
    @ApiOperation(value = "注册用户")
    public Response<?> register(@RequestBody UserRegisterDTO userRegisterDTO) {
        if (userService.register(userRegisterDTO)) {
            return Response.success();
        }
        return Response.failure();
    }

    @PostMapping
    @OptLog(optType = SAVE_OR_UPDATE)
    @ApiOperation(value = "新增或修改用户")
    public Response<?> saveOrUpdateUser(@RequestBody UserDTO userDTO) {
        if (userService.saveOrUpdateUser(userDTO)) {
            return Response.success();
        }
        return Response.failure();
    }

    @PutMapping("/able")
    @OptLog(optType = UPDATE)
    @ApiOperation(value = "禁用用户")
    public Response<?> updateUserAbleFlag(@RequestBody UserAbleDTO userAbleDTO) {
        if (userService.updateUserAble(userAbleDTO)) {
            return Response.success();
        }
        return Response.failure();
    }

    @PutMapping("/password")
    @OptLog(optType = UPDATE)
    @ApiOperation(value = "修改密码")
    public Response<?> updatePassword(@RequestBody UserPasswordDTO userPasswordDTO) {
        if (userService.updatePassword(userPasswordDTO)) {
            return Response.success();
        }
        return Response.failure();
    }

    @PutMapping("/forget")
    @ApiOperation(value = "忘记密码")
    public Response<?> forgetPassword(@RequestBody ForgetPasswordDTO forgetPasswordDTO) {
        if (userService.forget(forgetPasswordDTO)) {
            return Response.success();
        }
        return Response.failure();
    }

    @DeleteMapping
    @OptLog(optType = REMOVE)
    @ApiOperation(value = "删除用户")
    public Response<?> deleteUser(@RequestBody List<Integer> ids) {
        if (userService.removeBatchByIds(ids)) {
            return Response.success();
        }
        return Response.failure();
    }

    @DeleteMapping("/forceLogout")
    @OptLog(optType = REMOVE)
    @ApiOperation(value = "强制下线")
    public Response<?> removeOnlineUser(@RequestBody List<Integer> userIdList) {
        if (userService.removeOnlineUser(userIdList)) {
            return Response.success();
        }
        return Response.failure();
    }
}
