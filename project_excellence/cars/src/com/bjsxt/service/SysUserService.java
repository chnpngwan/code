package com.bjsxt.service;

import com.bjsxt.pojo.Page;
import com.bjsxt.pojo.SysUser;


public interface SysUserService {
    public Page<SysUser> findAll();
    //登录操作
    public SysUser login(String loginname,String pwd);
}
