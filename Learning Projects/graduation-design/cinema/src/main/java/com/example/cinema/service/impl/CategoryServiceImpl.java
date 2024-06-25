package com.example.cinema.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.cinema.entity.Category;
import com.example.cinema.mapper.CategoryMapper;
import com.example.cinema.service.CategoryService;
import com.example.cinema.utils.PageUtil;
import com.example.cinema.vo.PageResult;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {
    @Override
    public PageResult<Category> getCategoryPage(String keywords) {
        Page<Category> page = new Page<>(PageUtil.getCurrent(), PageUtil.getSize());
        Page<Category> categoryPage = baseMapper.selectPage(page, new LambdaQueryWrapper<Category>()
                .like(!StrUtil.isEmpty(keywords), Category::getName, keywords));
        return new PageResult<>(categoryPage.getRecords(), categoryPage.getTotal());
    }
}
