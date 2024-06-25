package com.example.cinema.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.cinema.entity.Category;
import com.example.cinema.vo.MovieCategoryVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryMapper extends BaseMapper<Category> {
    List<MovieCategoryVO> getMovieCategoryVOList();
}
