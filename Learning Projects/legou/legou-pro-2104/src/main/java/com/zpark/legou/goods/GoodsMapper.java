package com.zpark.legou.goods;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GoodsMapper {

    //新增一个商品
    int insertGoods(Goods goods);

    //批量下架商品
    int updateStatusDown(List<String> goodsId);

    //批量上架商品
    int updateStatusUp(List<String> goodsId);

}
