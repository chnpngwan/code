package com.flea.service;

import com.flea.entity.Category;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 商品分类表 服务类
 */
public interface CategoryService extends IService<Category> {

    /**
     * 根据id删除分类，当该分类关联其他商品时不允许删除
     * @param id
     */
    public void remove(Long id);
}
