package com.bjsxt.service;

import com.bjsxt.pojo.SysRoles;

import java.util.List;

public interface SysRolesService {
    //查询所有角色信息
    public List<SysRoles> findAll();
    //添加信息
    public int addRole(SysRoles sysRoles,Integer[] mids) throws Exception;
    //修改操作
    public int change(SysRoles sysRoles,Integer[] mids) throws Exception;
    //删除操作
    public int delete(int roleid);
}
