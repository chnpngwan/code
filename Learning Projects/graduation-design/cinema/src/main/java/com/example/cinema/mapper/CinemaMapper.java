package com.example.cinema.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.cinema.entity.Cinema;
import com.example.cinema.vo.CinemaVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CinemaMapper extends BaseMapper<Cinema> {
    List<CinemaVO> getCinemaPage(@Param("keywords") String keywords,
                                 @Param("start") Long start,
                                 @Param("size") Long size);
    Long getCinemaPageTotal(@Param("keywords") String keywords);

    List<Integer> getCinemaIdByCondition(@Param("start") Long start,
                                         @Param("size") Long size,
                                         @Param("brandId") Integer brandId,
                                         @Param("districtId") Integer districtId,
                                         @Param("typeId") Integer typeId,
                                         @Param("serveId") Integer serveId);
    Long getCinemaIdTotalByCondition(@Param("brandId") Integer brandId,
                                     @Param("districtId") Integer districtId,
                                     @Param("typeId") Integer typeId,
                                     @Param("serveId") Integer serveId);
}
