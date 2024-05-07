package com.sofftem.service;

import com.sofftem.bean.Order;
import com.sofftem.utils.Page;

import java.util.List;

public interface OrderService {
    String createOrder(List<Integer> cartIdList, Integer uid);

    Page<Order> page(int pageNo, int pageSize, int uid);
}
