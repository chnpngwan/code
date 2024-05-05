package com.flea.service.impl;

import com.flea.dto.OrderDto;
import com.flea.entity.Commodity;
import com.flea.entity.Orders;
import com.flea.entity.User;
import com.flea.service.CommodityService;
import com.flea.service.OrderDtoService;
import com.flea.service.OrderService;
import com.flea.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class OrderDtoServiceImpl implements OrderDtoService {

    @Autowired
    OrderService orderService;

    @Autowired
    CommodityService commodityService;

    @Autowired
    UserService userService;


    @Override
    public OrderDto getById(Long id) {
        Orders orders = orderService.getById(id);
        OrderDto orderDto = new OrderDto();

        orderDto.setId(orders.getId());
        orderDto.setCommodityName(orders.getCommodityName());
        orderDto.setCommodityId(orders.getCommodityId());
        orderDto.setSellerId(orders.getSellerId());
        orderDto.setBuyerId(orders.getBuyerId());
        orderDto.setStatus(orders.getStatus());

        Commodity commodity = commodityService.getById(orders.getCommodityId());
        orderDto.setCategoryName(commodity.getCategoryName());
        orderDto.setPrice(commodity.getPrice());
        orderDto.setDescription(commodity.getDescription());

        User seller = userService.getById(orders.getSellerId());
        User buyer = userService.getById(orders.getBuyerId());
        orderDto.setSellerName(seller.getUsername());
        orderDto.setBuyerName(buyer.getUsername());

        return orderDto;
    }
}
