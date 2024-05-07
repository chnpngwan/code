package com.sofftem.service.impl;

import com.sofftem.bean.CartItem;
import com.sofftem.bean.Order;
import com.sofftem.bean.OrderItem;
import com.sofftem.bean.Produce;
import com.sofftem.dao.CartItemDao;
import com.sofftem.dao.OrderDao;
import com.sofftem.dao.OrderItemDao;
import com.sofftem.dao.impl.CartItemDaoImpl;
import com.sofftem.dao.impl.OrderDaoImpl;
import com.sofftem.dao.impl.OrderItemDaoImpl;
import com.sofftem.dao.impl.ProduceDaoImpl;
import com.sofftem.service.OrderService;
import com.sofftem.utils.Page;

import java.util.ArrayList;
import java.util.List;

public class OrderServiceImpl implements OrderService {
    private OrderItemDao orderItemDao = new OrderItemDaoImpl();
    private OrderDao orderDao = new OrderDaoImpl();
    private CartItemDao cartItemDao = new CartItemDaoImpl();


    @Override
    public String createOrder(List<Integer> cartIdList, Integer uid) {
        //开启事务
        List<OrderItem> orderItemList = new ArrayList<>();
        //循环查询cartItem对象
        for (Integer id : cartIdList) {
            CartItem cartItem = cartItemDao.findCartById(id);
            cartItem.setTotalPrice(new ProduceServiceImpl().queryProduceById(cartItem.getPid()).getPrice() * cartItem.getCount());
            OrderItem orderItem = new OrderItem(null, cartItem.getPid(), cartItem.getCount(), cartItem.getTotalPrice(), null);
            orderItemList.add(orderItem);
        }
        Double totalPrice = 0.0;//此变量用于保存所有商品价格总和
        for (OrderItem orderItem : orderItemList) {
            totalPrice += orderItem.getTotalprice();//求出所有商品的总和
        }
        //创建订单成功后,返回此订单编号
        String orderId = orderDao.saveOrder(totalPrice, uid);
        //循环创建订单项
        for (OrderItem orderItem : orderItemList) {
            orderItemDao.saveOrderItem(orderItem, orderId);//创建订单项目
            Produce produce = new ProduceServiceImpl().queryProduceById(orderItem.getPid());
            produce.setSale(produce.getSale() + orderItem.getCount());//销量增加
            produce.setRepertory(produce.getRepertory() - orderItem.getCount());//库存减少
            new ProduceDaoImpl().updateProduce(produce);
        }
        for (Integer id : cartIdList) {
            cartItemDao.deleteCartById(id);//结账完成后要将购物车中的商品删除
        }
        return orderId;//返回一个订单编号
    }

    @Override
    public Page<Order> page(int pageNo, int pageSize, int uid) {
        Page<Order> page = new Page<>();
        page.setPageNo(pageNo);//将参数pageNo保存到page对象
        page.setPageSize(pageSize);//将参数pageSize保存到page对象
        //获取t_book表的总记数 , 并将总记数封装到page对象中
        page.setPageTotalCount(orderDao.queryForPageTotalCount(uid));
        //求出最大页
        if (page.getPageTotalCount() % page.getPageSize() == 0) {
            //使用  [总记录数 / 当前页显示数量 = 总页数]
            page.setPageTotal(page.getPageTotalCount() / pageSize);
        } else {
            //如果除不净的话,就需要+1  [总记录数 / 当前页显示数量 = 总页数 + 1]
            page.setPageTotal(page.getPageTotalCount() / pageSize + 1);
        }
        //如果当前页大于最大页
        if (page.getPageNo() > page.getPageTotal()) {
            page.setPageNo(page.getPageTotal());//就将最大页设置给当前页
        }
        //如果当前页小于最小页
        if (page.getPageNo() < 1) {
            page.setPageNo(1);//就将第一页设置给当前页
        }

        //通过当前网与每页显示数 求出 起始页
        int begin = (page.getPageNo() - 1) * page.getPageSize();
        List<Order> orderList = orderDao.queryForPageItems(begin, page.getPageSize(), uid);
        for (Order order : orderList) {
            order.setCount(new OrderItemDaoImpl().findCountByOrderId(order.getOrder_id()));
        }
        page.setItems(orderList);//将查询出来的结果集对象保存到page中
        return page;
    }
}
