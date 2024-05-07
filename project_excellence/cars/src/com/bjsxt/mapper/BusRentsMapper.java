package com.bjsxt.mapper;

import com.bjsxt.pojo.BusRents;

import java.util.List;

public interface BusRentsMapper {
    //添加租车信息
    public int insertOne(BusRents busRents);
    //多条件查询
    public List<BusRents> selectMore(BusRents busRents);
    //更改车辆状态
    public int updateCar(String   rentid);
}
