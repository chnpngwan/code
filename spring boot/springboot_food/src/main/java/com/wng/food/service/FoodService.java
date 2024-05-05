package com.wng.food.service;

import com.wng.food.entity.Food;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * ProjectName:  spring boot
 * PackageName:  com.wng.food.service
 * ClassName:    FoodService
 *
 * @Author chnpngwng
 * @Date 2023 06 07 10 26
 **/


public interface FoodService {
    /*
     * 条件查询
     * */
    List<Food> queryFoods(String name,String type);

    /*
     * 根据ID删除
     * */
    int deleteById(int id);
    /*
     * 添加
     * */
    int insert(Food food);
}
