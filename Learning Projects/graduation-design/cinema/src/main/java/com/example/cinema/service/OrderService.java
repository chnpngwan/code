package com.example.cinema.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.cinema.dto.OrderDTO;
import com.example.cinema.entity.Order;
import com.example.cinema.vo.OrderDetailVO;
import com.example.cinema.vo.PageResult;

public interface OrderService extends IService<Order> {
    Integer saveOrder(OrderDTO orderDTO);
    OrderDetailVO getOrderDetail(Integer orderId);
    PageResult<OrderDetailVO> getOrderUser(Integer userId);
    String payOrder(Integer orderId);
}
