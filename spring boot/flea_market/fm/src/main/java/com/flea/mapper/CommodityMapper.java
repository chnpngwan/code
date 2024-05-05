package com.flea.mapper;

import com.flea.entity.Commodity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 商品表 Mapper 接口
 */
@Mapper
public interface CommodityMapper extends BaseMapper<Commodity> {

}
