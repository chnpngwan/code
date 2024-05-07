package com.bjsxt.service;

import com.bjsxt.pojo.BusRents;
import com.bjsxt.pojo.Page;

import java.util.List;

public interface BusRentsService {
    //新加一条租车信息
    public int addOne(BusRents busRents) throws Exception;
    //多条件查询
    public Page<BusRents> findMore(BusRents busRents);
    //查找出租单号
    public BusRents findOneBusRents(BusRents busRents);
}
