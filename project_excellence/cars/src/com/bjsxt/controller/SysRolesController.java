package com.bjsxt.controller;

import com.bjsxt.pojo.SysRoles;
import com.bjsxt.service.SysRolesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("SysRolesController")
public class SysRolesController {

    @Autowired
    SysRolesService sysRolesService;


    @RequestMapping("findAll")
    @ResponseBody
    public List<SysRoles> findAll(){
        return sysRolesService.findAll();
    }

    //添加角色操作
    @RequestMapping("addRole")
    @ResponseBody
    public int addRole(SysRoles sysRoles,Integer[] mids) throws Exception {
        return sysRolesService.addRole(sysRoles, mids);
    }

    //修改操作
    @RequestMapping("changeRoles")
    @ResponseBody
    public int changeRoles(SysRoles sysRoles,Integer[] mids) throws Exception {
        return sysRolesService.change(sysRoles, mids);
    }

    //删除操作
    @RequestMapping("remove")
    @ResponseBody
    public int remove(int roleid){
        return sysRolesService.delete(roleid);
    }

}
