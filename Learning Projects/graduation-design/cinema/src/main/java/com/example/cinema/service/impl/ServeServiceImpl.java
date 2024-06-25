package com.example.cinema.service.impl;


import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.cinema.entity.District;
import com.example.cinema.entity.Serve;
import com.example.cinema.mapper.ServeMapper;
import com.example.cinema.service.ServeService;
import com.example.cinema.utils.PageUtil;
import com.example.cinema.vo.PageResult;
import com.example.cinema.vo.ServeVO;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ServeServiceImpl extends ServiceImpl<ServeMapper, Serve> implements ServeService {

    @Override
    public PageResult<Serve> getServePage(String keywords) {
        Page<Serve> page = new Page<>(PageUtil.getCurrent(), PageUtil.getSize());
        Page<Serve> servePage = baseMapper.selectPage(page, new LambdaQueryWrapper<Serve>()
                .like(!StrUtil.isEmpty(keywords), Serve::getName, keywords));
        return new PageResult<>(servePage.getRecords(), servePage.getTotal());
    }

    @Override
    public List<ServeVO> getServeList() {
        return this.list().stream().map(i -> ServeVO.builder()
                        .id(i.getId())
                        .name(i.getName())
                        .build())
                .collect(Collectors.toList());
    }
}
