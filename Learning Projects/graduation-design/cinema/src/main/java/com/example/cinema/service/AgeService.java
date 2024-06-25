package com.example.cinema.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.cinema.entity.Age;
import com.example.cinema.vo.PageResult;

import java.util.List;

public interface AgeService extends IService<Age> {
    PageResult<Age> getAgePage(String keywords);
}
