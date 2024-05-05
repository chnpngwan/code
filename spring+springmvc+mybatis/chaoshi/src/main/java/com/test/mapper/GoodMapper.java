package com.test.mapper;

import com.test.model.Good;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.test.mapper
 * ClassName:     GoodMapper
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 24 15 34
 **/


public interface GoodMapper {
    List<Good> selectGoods(@Param("name") String name);
    int insertGoods(Good good);
    int deleteGoods(@Param("id") int id);
}
