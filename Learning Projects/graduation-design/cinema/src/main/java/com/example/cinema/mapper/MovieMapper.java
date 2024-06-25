package com.example.cinema.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.cinema.dto.MovieFrontDTO;
import com.example.cinema.entity.*;
import com.example.cinema.vo.MovieActorVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MovieMapper extends BaseMapper<Movie> {
    Area getAreaByMovieId(@Param("movieId") Integer movieId);
    Age getAgeByMovieId(@Param("movieId") Integer movieId);
    List<Category> getCategoryListByMovieId(@Param("movieId") Integer movieId);
    List<MovieActorVO> getMovieActorListByMovieId(@Param("movieId") Integer movie);
    int updateMovieImageByMovieId(@Param("movieId") Integer movieId);
    List<Integer> getOngoingMovieIdByCondition(@Param("startRow") Long startRow,
                                               @Param("size") Long size,
                                               @Param("categoryId") Integer categoryId,
                                               @Param("areaId") Integer areaId,
                                               @Param("ageId") Integer ageId,
                                               @Param("orderType") Integer orderType);

    Long getOngoingMovieTotalByCondition(@Param("categoryId") Integer categoryId,
                                         @Param("areaId") Integer areaId,
                                         @Param("ageId") Integer ageId);

    List<Integer> getUpcomingMovieIdByCondition(@Param("startRow") Long startRow,
                                                @Param("size") Long size,
                                                @Param("categoryId") Integer categoryId,
                                                @Param("areaId") Integer areaId,
                                                @Param("ageId") Integer ageId,
                                                @Param("orderType") Integer orderType);

    Long getUpcomingMovieTotalByCondition(@Param("categoryId") Integer categoryId,
                                          @Param("areaId") Integer areaId,
                                          @Param("ageId") Integer ageId);

    List<Integer> getClassicMovieIdByCondition(@Param("startRow") Long startRow,
                                               @Param("size") Long size,
                                               @Param("categoryId") Integer categoryId,
                                               @Param("areaId") Integer areaId,
                                               @Param("ageId") Integer ageId,
                                               @Param("orderType") Integer orderType);
    Long getClassicMovieTotalByCondition(@Param("categoryId") Integer categoryId,
                                          @Param("areaId") Integer areaId,
                                          @Param("ageId") Integer ageId);
    List<Rank> getTop100MovieIdList();
    List<Rank> getReputationMovieIdList();
    List<Rank> getTodayGross();
}
