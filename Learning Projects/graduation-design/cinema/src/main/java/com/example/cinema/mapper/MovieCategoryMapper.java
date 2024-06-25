package com.example.cinema.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.cinema.entity.MovieCategory;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MovieCategoryMapper extends BaseMapper<MovieCategory> {
}
