package com.sofftem.dao.impl;

import com.sofftem.bean.Order;
import com.sofftem.dao.OrderDao;
import com.sofftem.utils.BaseDao;

import java.util.List;
import java.util.Random;

public class OrderDaoImpl extends BaseDao<Order> implements OrderDao {
    @Override
    public String saveOrder(Double totalprice, Integer uid) {
        Random r = new Random();
        String orderId = "" + System.currentTimeMillis() + (int) (Math.random() * 1000) + uid;
        super.update("insert into `order` values(?,now(),?,?,?)", orderId, totalprice, 0, uid);
        return orderId;
    }

    @Override
    public List<Order> queryOrderByUid(Integer uid) {
        return this.getBeanList("select * from `order` where uid = ?", uid);
    }

    @Override
    public Integer queryForPageTotalCount(Integer uid) {
        return this.getValue("select count(*) from `order` where uid = ?", uid).intValue();
    }

    @Override
    public List<Order> queryForPageItems(int begin, int pageSize, int uid) {
        return this.getBeanList("select * from `order` where uid = ? order by create_time desc limit ?,?", uid, begin, pageSize);
    }
}
