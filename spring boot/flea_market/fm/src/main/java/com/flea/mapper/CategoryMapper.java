package com.flea.mapper;

import com.flea.entity.Category;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 商品分类表 Mapper 接口
 */
@Mapper
public interface CategoryMapper extends BaseMapper<Category> {

}
