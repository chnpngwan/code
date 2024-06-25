package com.example.cinema.service;

import com.example.cinema.vo.MovieVO;
import com.example.cinema.vo.PageResult;

public interface RankService {
    PageResult<MovieVO> getTop100Movie();
    PageResult<MovieVO> getReputationMovie();
    PageResult<MovieVO> getGrossMovie();
    PageResult<MovieVO> getTodayGross();
}
