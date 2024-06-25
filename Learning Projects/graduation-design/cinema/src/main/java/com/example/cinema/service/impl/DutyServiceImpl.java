package com.example.cinema.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.cinema.entity.Duty;
import com.example.cinema.mapper.DutyMapper;
import com.example.cinema.service.DutyService;
import com.example.cinema.utils.PageUtil;
import com.example.cinema.vo.PageResult;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class DutyServiceImpl extends ServiceImpl<DutyMapper, Duty> implements DutyService {
    @Override
    public PageResult<Duty> getDutyPage(String keywords) {
        Page<Duty> page = new Page<>(PageUtil.getCurrent(), PageUtil.getSize());
        Page<Duty> dutyPage = baseMapper.selectPage(page, new LambdaQueryWrapper<Duty>()
                .like(!StrUtil.isEmpty(keywords), Duty::getName, keywords));
        return new PageResult<>(dutyPage.getRecords(), dutyPage.getTotal());
    }
}
