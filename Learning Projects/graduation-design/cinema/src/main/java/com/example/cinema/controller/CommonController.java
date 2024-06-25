package com.example.cinema.controller;

import com.example.cinema.service.CommonService;
import com.example.cinema.vo.HomePageVO;
import com.example.cinema.vo.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(tags = "通用模块")
@RestController
public class CommonController {
    @Autowired
    private CommonService commonService;

    @GetMapping("/token")
    @ApiOperation(value = "获取唯一标识")
    public Response<String> getToken() {
        return Response.success(commonService.getToken());
    }

    @GetMapping("/homePage")
    @ApiOperation(value = "获取后台首页统计数据")
    public Response<HomePageVO> getHomePageVO() {
        return Response.success(commonService.getHomePageVO());
    }

    @GetMapping("/register/code")
    @ApiOperation(value = "获取注册验证码")
    public Response<?> getRegisterCode(String to) {
        commonService.getRegisterCode(to);
        return Response.success();
    }

    @GetMapping("/forget/code")
    @ApiOperation(value = "获取忘记密码验证码")
    public Response<?> getForgetCode(String to) {
        commonService.getForgetCode(to);
        return Response.success();
    }

    @GetMapping("/view")
    public Response<?> incrViewCount() {
        commonService.incrViewCount();
        return Response.success();
    }
}
