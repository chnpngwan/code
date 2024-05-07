package com.sofftem.dao;

import com.sofftem.bean.Order;

import java.util.List;

public interface OrderDao {
    String saveOrder(Double totalprice, Integer uid);

    List<Order> queryOrderByUid(Integer uid);

    Integer queryForPageTotalCount(Integer uid);

    List<Order> queryForPageItems(int begin, int pageSize, int uid);

}
