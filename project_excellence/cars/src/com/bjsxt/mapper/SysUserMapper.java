package com.bjsxt.mapper;

import com.bjsxt.pojo.SysUser;

import java.util.List;

public interface SysUserMapper {
    public List<SysUser> selectAll();

    //登录页面
    public SysUser selectUser(String loginname,String pwd);
}
