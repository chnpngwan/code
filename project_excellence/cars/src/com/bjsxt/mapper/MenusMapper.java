package com.bjsxt.mapper;

import com.bjsxt.pojo.Menus;
import com.bjsxt.pojo.Tree;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenusMapper {
    //查询菜单
    public List<Menus> selectMore(@Param("pid") int pid);
    //根据不同的角色查询菜单
    public List<Menus> selectMore2(int rid, int pid);
    //添加菜单操作
    public int insertMenus(Menus menus);
    //修改菜单状态
    public int updateMenus(int id);
    //修改菜单信息
    public int updateMenus2(Menus menus);
    //删除菜单
    public int deleteMenu(int id);
    //查询菜单--父子节点分开
    public List<Tree> selectAll(int pid);
}
