package com.flea.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.flea.entity.Commodity;
import com.flea.entity.Orders;

/**
 * 订单表 服务类
 */
public interface OrderService extends IService<Orders> {

    void saveByCommodity(Commodity commodity);

    void update(Long id, int status);
}
