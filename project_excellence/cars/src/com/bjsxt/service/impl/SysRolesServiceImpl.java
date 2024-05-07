package com.bjsxt.service.impl;

import com.bjsxt.mapper.RmMapper;
import com.bjsxt.mapper.SysRolesMapper;
import com.bjsxt.pojo.SysRoles;
import com.bjsxt.service.SysRolesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysRolesServiceImpl implements SysRolesService {

    @Autowired
    SysRolesMapper sysRolesMapper;
    @Autowired
    RmMapper rmMapper;

    @Override
    public List<SysRoles> findAll() {
        return sysRolesMapper.selectAll();
    }

    @Override
    public int addRole(SysRoles sysRoles,Integer[] mids) throws Exception {
        int i = 0;
        try {
            sysRolesMapper.insertRole(sysRoles);
            for (Integer mid : mids) {
                rmMapper.insertRM(sysRoles.getRoleid(), mid);
            }
            i=1;
        } catch (Exception e) {
            throw new Exception();
        }
        return i;
    }

    @Override
    public int change(SysRoles sysRoles,Integer[] mids) throws Exception {
        int i =0;
        try {
            //修改角色信息
            sysRolesMapper.update(sysRoles);
            //删除节点
            rmMapper.delete(sysRoles.getRoleid());
            //重新插入操作
            for (Integer mid : mids) {
                rmMapper.insertRM(sysRoles.getRoleid(),mid);
            }
            i=1;
        } catch (Exception e) {
            throw new Exception();
        }
        return i;
    }

    @Override
    public int delete(int roleid) {
        return sysRolesMapper.delete(roleid);
    }
}
