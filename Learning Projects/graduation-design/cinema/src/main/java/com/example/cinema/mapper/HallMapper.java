package com.example.cinema.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.cinema.entity.Hall;
import com.example.cinema.vo.HallVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface HallMapper extends BaseMapper<Hall> {
    List<HallVO> getHallVOPage(@Param("keywords") String keywords,
                               @Param("start") Long start,
                               @Param("size") Long size);
    Integer getHallVOPageTotal(@Param("keywords") String keywords);
}
