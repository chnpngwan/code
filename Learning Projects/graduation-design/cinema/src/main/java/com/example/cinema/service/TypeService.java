package com.example.cinema.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.cinema.entity.Type;
import com.example.cinema.vo.PageResult;
import com.example.cinema.vo.TypeVO;

import java.util.List;

public interface TypeService extends IService<Type> {
    PageResult<Type> getTypePage(String keywords);
    List<TypeVO> getTypeList();
}
