package com.bjsxt.mapper;

import com.bjsxt.pojo.SysRoles;

import java.util.List;

public interface SysRolesMapper {
    //查询所有角色信息
    public List<SysRoles> selectAll();
    //添加操作
    public int insertRole(SysRoles sysRoles);
    //修改操作
    public int update(SysRoles sysRoles);
    //删除
    public int delete(int roleid);
}
