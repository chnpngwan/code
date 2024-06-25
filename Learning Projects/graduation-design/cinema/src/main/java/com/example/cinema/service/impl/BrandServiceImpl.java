package com.example.cinema.service.impl;


import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.cinema.entity.Age;
import com.example.cinema.entity.Brand;
import com.example.cinema.mapper.BrandMapper;
import com.example.cinema.service.BrandService;
import com.example.cinema.utils.PageUtil;
import com.example.cinema.vo.BrandVO;
import com.example.cinema.vo.PageResult;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class BrandServiceImpl extends ServiceImpl<BrandMapper, Brand> implements BrandService {

    @Override
    public PageResult<Brand> getBrandPage(String keywords) {
        Page<Brand> page = new Page<>(PageUtil.getCurrent(), PageUtil.getSize());
        Page<Brand> brandPage = baseMapper.selectPage(page, new LambdaQueryWrapper<Brand>()
                .like(!StrUtil.isEmpty(keywords), Brand::getName, keywords));
        return new PageResult<>(brandPage.getRecords(), brandPage.getTotal());
    }

    @Override
    public List<BrandVO> getBrandList() {
        return this.list().stream().map(i -> BrandVO.builder()
                .id(i.getId())
                .name(i.getName())
                .build()).collect(Collectors.toList());
    }
}
