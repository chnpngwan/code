package com.example.cinema.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.cinema.entity.Age;
import com.example.cinema.mapper.AgeMapper;
import com.example.cinema.service.AgeService;
import com.example.cinema.utils.PageUtil;
import com.example.cinema.vo.PageResult;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class AgeServiceImpl extends ServiceImpl<AgeMapper, Age> implements AgeService {
    @Override
    public PageResult<Age> getAgePage(String keywords) {
        Page<Age> page = new Page<>(PageUtil.getCurrent(), PageUtil.getSize());
        Page<Age> agePage = baseMapper.selectPage(page, new LambdaQueryWrapper<Age>()
                .like(!StrUtil.isEmpty(keywords), Age::getName, keywords));
        return new PageResult<>(agePage.getRecords(), agePage.getTotal());
    }
}
