package com.test.service.impl;

import com.test.mapper.GoodMapper;
import com.test.model.Good;
import com.test.service.GoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.test.service.impl
 * ClassName:     GoodServiceImpl
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 24 15 40
 **/

@Service
public class GoodServiceImpl implements GoodService {
    @Autowired
    private GoodMapper goodMapper;
    @Override
    public List<Good> selectGoods(String name) {
        System.out.println(goodMapper);
        return goodMapper.selectGoods(name);
    }

    @Override
    public int insertGoods(Good good) {
        return goodMapper.insertGoods(good);
    }

    @Override
    public int deleteGoods(int id) {
        return goodMapper.deleteGoods(id);
    }
}
