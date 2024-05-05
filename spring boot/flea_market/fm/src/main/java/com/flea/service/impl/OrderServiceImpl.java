package com.flea.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.flea.entity.Commodity;
import com.flea.entity.Orders;
import com.flea.entity.User;
import com.flea.mapper.OrderMapper;
import com.flea.service.OrderService;
import com.flea.util.JwtUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 订单表 服务实现类
 */
@Service
@Transactional
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Orders> implements OrderService {

    /**
     * 根据商品添加订单
     * @param commodity
     */
    @Override
    public void saveByCommodity(Commodity commodity) {

        Orders orders = new Orders();
        orders.setCommodityId(commodity.getId());
        orders.setCommodityName(commodity.getName());
        orders.setSellerId(commodity.getSellerId());

        User currentUser = JwtUtil.getCurrentUser();
        orders.setBuyerId(currentUser.getId());

        super.save(orders);
    }

    @Override
    public void update(Long id, int status) {
        Orders orders = new Orders();
        orders.setId(id);
        orders.setStatus(status);
        super.updateById(orders);
    }
}
