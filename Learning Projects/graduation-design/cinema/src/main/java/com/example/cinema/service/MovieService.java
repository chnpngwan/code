package com.example.cinema.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.cinema.dto.MovieDTO;
import com.example.cinema.dto.MovieFrontDTO;
import com.example.cinema.entity.Movie;
import com.example.cinema.vo.*;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface MovieService extends IService<Movie> {
    PageResult<MovieVO> getMovieVOPage(String keywords);
    List<MovieSimpleVO> getMovieSimpleVOPage();
    MovieDetailVO getMovieDetailByMovieId(Integer movieId);
    boolean saveOrUpdateMovie(MovieDTO movieDTO);
    boolean deleteMovie(List<Integer> ids);
    List<MovieActorVO> getMovieActorByMovieId(Integer movieId);
    boolean saveMovieActorDuty(MovieActorDutyDTO movieActorDutyDTO);
    boolean deleteMovieActorDuty(MovieActorDutyDTO movieActorDutyDTO);
    boolean deleteMovieImage(Integer movieId);
    PageResult<MovieFrontVO> getOngoingMovie(Integer categoryId,Integer areaId, Integer ageId,Integer orderType);
    PageResult<MovieFrontVO> getUpcomingMovie(Integer categoryId,Integer areaId, Integer ageId,Integer orderType);
    PageResult<MovieFrontVO> getClassicMovie(Integer categoryId,Integer areaId, Integer ageId,Integer orderType);
    List<MovieFrontVO> getMovieFrOntVOByMovieId(List<Integer> movieIdList);
    List<MovieVO> getMovieVOListByMovieIdList(List<Integer> movieIdList);
    void incrMovieViewCount(Integer movieId);
}
