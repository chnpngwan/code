package com.flea.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.flea.common.CustomException;
import com.flea.entity.Commodity;
import com.flea.entity.Orders;
import com.flea.mapper.CommodityMapper;
import com.flea.service.CommodityService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.flea.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 商品表 服务实现类
 */
@Service
@Transactional
public class CommodityServiceImpl extends ServiceImpl<CommodityMapper, Commodity> implements CommodityService {

    @Autowired
    private OrderService orderService;

    /**
     * 根据id删除商品，如果已经在某个订单中，则不允许删除
     * @param id
     */
    @Override
    public void deleteById(Long id) {
        LambdaQueryWrapper<Orders> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Orders::getCommodityId, id);
        int count = orderService.count(queryWrapper);
        if (count != 0){
            throw new CustomException("当前商品已被购买，不允许删除！");
        }
        super.removeById(id);
    }

    /**
     * 如果商品在某个订单中，不允许修改
     * @param commodity
     */
    @Override
    public void update(Commodity commodity) {
        LambdaQueryWrapper<Orders> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Orders::getCommodityId, commodity.getId());
        int count = orderService.count(queryWrapper);
        if (count != 0){
            throw new CustomException("当前商品已被购买，不允许修改！");
        }
        super.updateById(commodity);
    }
}
