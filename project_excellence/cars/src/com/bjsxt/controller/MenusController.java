package com.bjsxt.controller;

import com.bjsxt.pojo.Menus;
import com.bjsxt.pojo.Page;
import com.bjsxt.pojo.SysUser;
import com.bjsxt.pojo.Tree;
import com.bjsxt.service.MenusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("MenusController")
public class MenusController {

    @Autowired
    MenusService menusService;

    @RequestMapping("findMore")
    @ResponseBody
    public List<Tree> findMore(@RequestParam(defaultValue = "1") int id){
        List<Tree> list = menusService.findMore(id);
        return list;
    }

    @RequestMapping("findMore2")
    @ResponseBody
    public List<Tree> findMore2(HttpSession session,@RequestParam(defaultValue = "1") int id){
        SysUser sysUser = (SysUser) session.getAttribute("sysUser");
        List<Tree> list = menusService.findMore2(sysUser.getType(),id);
        return list;
    }



    //查询所有菜单
    @RequestMapping("findAllMenus")
    @ResponseBody
    public Page<Menus> findAllMenus(int page,int rows){
        return menusService.findAll(page, rows);
    }


    //添加菜单
    @RequestMapping("addMenus")
    @ResponseBody
    public int addMenus(Menus menus) throws Exception {
         return menusService.addMenus(menus);
    }

    //修改菜单信息
    @RequestMapping("changeMenus")
    @ResponseBody
    public int changeMenus(Menus menus) throws Exception {
        return menusService.changeMenus(menus);
    }

    //删除菜单
    @RequestMapping("removeMenu")
    @ResponseBody
    public int removeMenu(int id){
        return menusService.remove(id);
    }

    //查询所有父子节点菜单
    @RequestMapping("findAll")
    @ResponseBody
    public List<Tree> findAll(){
        return menusService.findAll();
    }

    //注销session
    @RequestMapping("logOut")
    public void logOut(HttpSession session, HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
        session.invalidate();
        req.getRequestDispatcher("/login.jsp").forward(req,resp);
    }

}
