package com.example.cinema.service.impl;


import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.cinema.entity.District;

import com.example.cinema.mapper.DistrictMapper;
import com.example.cinema.service.DistrictService;
import com.example.cinema.utils.PageUtil;
import com.example.cinema.vo.BrandVO;
import com.example.cinema.vo.DistrictVO;
import com.example.cinema.vo.PageResult;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


@Service
public class DistrictServiceImpl extends ServiceImpl<DistrictMapper, District> implements DistrictService {

    @Override
    public PageResult<District> getDistrictPage(String keywords) {
        Page<District> page = new Page<>(PageUtil.getCurrent(), PageUtil.getSize());
        Page<District> districtPage = baseMapper.selectPage(page, new LambdaQueryWrapper<District>()
                .like(!StrUtil.isEmpty(keywords), District::getName, keywords));
        return new PageResult<>(districtPage.getRecords(), districtPage.getTotal());
    }

    @Override
    public List<DistrictVO> getDistrictList() {
        return this.list().stream().map(i -> DistrictVO.builder()
                .id(i.getId())
                .name(i.getName())
                .build()).collect(Collectors.toList());
    }
}
