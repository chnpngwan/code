package com.example.cinema.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.cinema.entity.Menu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface MenuMapper extends BaseMapper<Menu> {
    List<Menu> listMenusByUserId(Integer userId);
}
