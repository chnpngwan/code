package com.example.cinema.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.cinema.entity.Category;
import com.example.cinema.vo.PageResult;

public interface CategoryService extends IService<Category> {
    PageResult<Category> getCategoryPage(String keywords);
}
