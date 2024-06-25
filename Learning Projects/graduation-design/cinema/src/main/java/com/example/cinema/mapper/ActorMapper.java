package com.example.cinema.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.cinema.entity.Actor;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ActorMapper extends BaseMapper<Actor> {
}
