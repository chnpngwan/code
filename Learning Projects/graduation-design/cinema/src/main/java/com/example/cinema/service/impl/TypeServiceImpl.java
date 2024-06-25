package com.example.cinema.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.cinema.entity.Type;
import com.example.cinema.service.TypeService;
import com.example.cinema.mapper.TypeMapper;
import com.example.cinema.utils.PageUtil;
import com.example.cinema.vo.PageResult;
import com.example.cinema.vo.TypeVO;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


@Service
public class TypeServiceImpl extends ServiceImpl<TypeMapper, Type> implements TypeService{

    @Override
    public PageResult<Type> getTypePage(String keywords) {
        Page<Type> page = new Page<>(PageUtil.getCurrent(), PageUtil.getSize());
        Page<Type> typePage = baseMapper.selectPage(page, new LambdaQueryWrapper<Type>()
                .like(!StrUtil.isEmpty(keywords), Type::getName, keywords));
        return new PageResult<>(typePage.getRecords(), typePage.getTotal());
    }

    @Override
    public List<TypeVO> getTypeList() {
        return this.list().stream().map(i -> TypeVO.builder()
                        .id(i.getId())
                        .name(i.getName())
                        .build())
                .collect(Collectors.toList());
    }
}
