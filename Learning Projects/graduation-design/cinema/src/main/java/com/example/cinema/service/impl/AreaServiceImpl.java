package com.example.cinema.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.cinema.entity.Area;
import com.example.cinema.mapper.AreaMapper;
import com.example.cinema.service.AreaService;
import com.example.cinema.utils.PageUtil;
import com.example.cinema.vo.PageResult;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class AreaServiceImpl extends ServiceImpl<AreaMapper, Area> implements AreaService {
    @Override
    public PageResult<Area> getAreaPage(String keywords) {
        Page<Area> page = new Page<>(PageUtil.getCurrent(), PageUtil.getSize());
        Page<Area> areaPage = baseMapper.selectPage(page, new LambdaQueryWrapper<Area>()
                .like(!StrUtil.isEmpty(keywords), Area::getName, keywords));
        return new PageResult<>(areaPage.getRecords(), areaPage.getTotal());
    }
}
