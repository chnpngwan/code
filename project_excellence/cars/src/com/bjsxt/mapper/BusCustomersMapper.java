package com.bjsxt.mapper;

import com.bjsxt.pojo.BusCustomers;

public interface BusCustomersMapper {
    //查找用户
    public BusCustomers selectOne(String identity);
}
