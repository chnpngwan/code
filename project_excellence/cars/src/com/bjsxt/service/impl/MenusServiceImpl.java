package com.bjsxt.service.impl;

import com.bjsxt.mapper.MenusMapper;
import com.bjsxt.pojo.Menus;
import com.bjsxt.pojo.Page;
import com.bjsxt.pojo.Tree;
import com.bjsxt.service.MenusService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class MenusServiceImpl implements MenusService {

    @Autowired
    MenusMapper menusMapper;

    @Override
    public List<Tree> findMore(int pid) {
        List<Menus> list = menusMapper.selectMore(pid);
            List<Tree> t = new ArrayList<>();
        for (Menus menus : list){
            Tree tree = new Tree(menus.getId(),menus.getName(),menus.getOpen()==1?"closed":"open");
            tree.setUrl(menus.getUrl());
            t.add(tree);
        }
        return t;
    }

    @Override
    public List<Tree> findMore2(int rid, int pid) {
        List<Menus> list = menusMapper.selectMore2(rid, pid);
        List<Tree> t = new ArrayList<>();
        for (Menus menus : list){
            Tree tree = new Tree(menus.getId(),menus.getName(),menus.getOpen()==1?"closed":"open");
            tree.setUrl(menus.getUrl());
            t.add(tree);
        }
        return t;
    }

    @Override
    public Page<Menus> findAll(int page, int rows) {
        com.github.pagehelper.Page page1 = PageHelper.startPage(page, rows);
        List<Menus> list = menusMapper.selectMore(-1);
        Page<Menus> pg = new Page<>(list,page1.getTotal());
        return pg;
    }

    @Override
    public int addMenus(Menus menus) throws Exception {
        int i = 0;
        try {
            //添加菜单
            i = menusMapper.insertMenus(menus);
            //修改当前添加菜单的父节点菜单(当前数据的pid是要修改数据的id)
            menusMapper.updateMenus(menus.getPid());
            i=1;
        } catch (Exception e) {
            throw new Exception();
        }
        return i;
    }

    @Override
    public int changeMenus(Menus menus) throws Exception {
        int i = menusMapper.updateMenus2(menus);
        //修改父节点状态
            menusMapper.updateMenus(menus.getPid());
        return i;
    }

    @Override
    public int remove(int id) {
        List<Menus> list = menusMapper.selectMore(id);
        if(list.size()>0){
            return -10;
        }
        return menusMapper.deleteMenu(id);
    }

    @Override
    public List<Tree> findAll() {
        //父节点的菜单
        List<Tree> list = menusMapper.selectAll(1);
        for (Tree t : list) {
            //子节点的菜单
            List<Tree> list2 = menusMapper.selectAll(t.getId());
            t.setChildren(list2);
        }
        return list;
    }
}
