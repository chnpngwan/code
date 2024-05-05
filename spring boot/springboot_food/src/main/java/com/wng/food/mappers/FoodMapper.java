package com.wng.food.mappers;

import com.wng.food.entity.Food;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * ProjectName:  spring boot
 * PackageName:  com.wng.food.mappers
 * ClassName:    FoodMapper
 *
 * @Author chnpngwng
 * @Date 2023 06 07 10 14
 **/

@Mapper
public interface FoodMapper {

    /*
    * 条件查询
    * */
    List<Food> queryFoods(@Param("name") String name,@Param("type") String type);

    /*
    * 根据ID删除
    * */
    @Delete("delete from tb_food where id=#{id}")
    int deleteById(@Param("id") int id);

    /*
    * 添加
    * */
    @Insert("insert into tb_food(name,type,price,buyer,buy_time) values (name=#{name},type=#{type},price=#{price},buyer=#{buyer},buy_time=#{buyTime})")
    int insert(Food food);
}
