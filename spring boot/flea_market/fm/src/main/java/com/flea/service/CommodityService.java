package com.flea.service;

import com.flea.entity.Commodity;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 商品表 服务类
 */
public interface CommodityService extends IService<Commodity> {

    /**
     * 根据id删除商品，如果已经在某个订单中，则不允许删除
     * @param id
     */
    void deleteById(Long id);

    void update(Commodity commodity);
}
