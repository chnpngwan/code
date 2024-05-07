package com.bjsxt.service;

import com.bjsxt.pojo.BusCars;
import com.bjsxt.pojo.Page;

import java.util.List;


public interface BusCarsService {
    //查询所有车辆信息
    public Page<BusCars> findAll(int page, int rows);
    //添加车辆信息
    public int addCars(BusCars busCars);
    //更改车辆信息
    public int changeCars(BusCars busCars);
    //删除一条信息
    public int remove(String carnumber);
    //查询可以出租的车
    public List<BusCars> findIsRenting();
    //查询车辆信息
    public BusCars findOne(String carnumber);
}
