package com.bjsxt.mapper;

import java.util.List;

public interface RmMapper {
    //增加数据
    public int insertRM(int rid ,int mid);
    //查询mid
    public List<Integer> selectMid(int rid);
    //修改节点菜单-->先删除后添加
    public int delete(int rid);
}
