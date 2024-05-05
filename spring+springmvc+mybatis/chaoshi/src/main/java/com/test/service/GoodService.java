package com.test.service;

import com.test.model.Good;

import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.test.service
 * ClassName:     GoodService
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 24 15 40
 **/


public interface GoodService {
    List<Good> selectGoods(String name);
    int insertGoods(Good good);
    int deleteGoods(int id);
}
