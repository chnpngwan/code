package com.sofftem.dao;

import com.sofftem.bean.OrderItem;

public interface OrderItemDao {
    void saveOrderItem(OrderItem orderItem, String orderId);
    Integer findCountByOrderId(String order_id);
}
