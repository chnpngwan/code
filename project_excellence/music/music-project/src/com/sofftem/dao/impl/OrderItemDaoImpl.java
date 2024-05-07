package com.sofftem.dao.impl;

import com.sofftem.bean.OrderItem;
import com.sofftem.dao.OrderItemDao;
import com.sofftem.utils.BaseDao;

public class OrderItemDaoImpl extends BaseDao<OrderItem> implements OrderItemDao {
    @Override
    public void saveOrderItem(OrderItem orderItem, String orderId) {
        super.update("insert into order_item(id,pid,count,totalprice,order_id) values(null,?,?,?,?)",
                orderItem.getPid(), orderItem.getCount(), orderItem.getTotalprice(), orderId);
    }

    @Override
    public Integer findCountByOrderId(String order_id) {
        return this.getValue("select count(*) from order_item where order_id = ?", order_id).intValue();
    }
}
