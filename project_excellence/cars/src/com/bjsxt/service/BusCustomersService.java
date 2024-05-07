package com.bjsxt.service;

import com.bjsxt.pojo.BusCustomers;

public interface BusCustomersService {
    //查找一条用户信息
    public BusCustomers findOne(String identity);
}
