package com.flea.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.flea.common.CustomException;
import com.flea.entity.Category;
import com.flea.entity.Commodity;
import com.flea.mapper.CategoryMapper;
import com.flea.service.CategoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.flea.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 商品分类表 服务实现类
 */
@Service
@Transactional
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {

    @Autowired
    private CommodityService commodityService;

    /**
     * 根据id删除分类，当该分类关联其他商品时不允许删除
     * @param id
     */
    @Override
    public void remove(Long id) {
        //关联了商品，不允许删除
        LambdaQueryWrapper<Commodity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Commodity::getCategoryId, id);
        int commodityCount = commodityService.count(queryWrapper);
        if (commodityCount != 0) {
            throw new CustomException("当前分类关联了商品，不允许删除!");
        }

        super.removeById(id);
    }
}
