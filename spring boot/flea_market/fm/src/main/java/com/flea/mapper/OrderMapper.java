package com.flea.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.flea.entity.Orders;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 订单表 Mapper 接口
 */
@Mapper
public interface OrderMapper extends BaseMapper<Orders> {

//    @Update("update `orders` set status=#{status} where id=#{id} ")
    void update(@Param("id") Long id, @Param("status") int status);

}
