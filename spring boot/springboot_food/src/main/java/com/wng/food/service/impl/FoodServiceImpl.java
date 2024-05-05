package com.wng.food.service.impl;

import com.wng.food.entity.Food;
import com.wng.food.mappers.FoodMapper;
import com.wng.food.service.FoodService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * ProjectName:  spring boot
 * PackageName:  com.wng.food.service.impl
 * ClassName:    FoodServiceImpl
 *
 * @Author chnpngwng
 * @Date 2023 06 07 10 27
 **/

@Service
public class FoodServiceImpl implements FoodService {
    @Resource
    private FoodMapper foodMapper;

    @Override
    public List<Food> queryFoods(String name, String type) {
        return foodMapper.queryFoods(name, type);
    }

    @Override
    public int deleteById(int id) {
        return foodMapper.deleteById(id);
    }

    @Override
    public int insert(Food food) {
        return foodMapper.insert(food);
    }
}
