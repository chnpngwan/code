package com.bjsxt.service;


import com.bjsxt.pojo.Menus;
import com.bjsxt.pojo.Page;
import com.bjsxt.pojo.Tree;
import java.util.List;

public interface MenusService {
    //查询菜单
    public List<Tree> findMore(int pid);
    //根据不同的角色查询菜单
    public List<Tree> findMore2(int rid,int pid);
    //查询所有菜单操作
    public Page<Menus> findAll(int page, int rows);
    //添加菜单操作
    public int addMenus(Menus menus) throws Exception;
    //修改菜单信息
    public int changeMenus(Menus menus) throws Exception;
    //删除菜单
    public int remove(int id);
    //查询菜单
    public List<Tree> findAll();
}
