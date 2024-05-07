package com.bjsxt.controller;

import com.bjsxt.pojo.Page;
import com.bjsxt.pojo.SysUser;
import com.bjsxt.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("SysUserController")
public class SysUserController {

    @Autowired
    SysUserService sysUserService;

    @RequestMapping("findAll")
    @ResponseBody
    public Page<SysUser> findAll(){
        return sysUserService.findAll();
    }

    //登陆
    @RequestMapping("login")
    @ResponseBody
    public SysUser login(String loginname, String pwd, HttpSession session){
        SysUser sysUser = sysUserService.login(loginname, pwd);
        session.setAttribute("sysUser",sysUser);
        return sysUser;
    }
}
