package com.example.cinema.service.impl;

import com.example.cinema.constant.RedisPreFixConstant;
import com.example.cinema.entity.Age;
import com.example.cinema.entity.Area;
import com.example.cinema.entity.Category;
import com.example.cinema.entity.Movie;
import com.example.cinema.mapper.MovieMapper;
import com.example.cinema.service.MovieService;
import com.example.cinema.service.RankService;
import com.example.cinema.service.RedisService;
import com.example.cinema.utils.BeanCopyUtil;
import com.example.cinema.utils.PageUtil;
import com.example.cinema.vo.MovieVO;
import com.example.cinema.vo.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class RankServiceImpl implements RankService {
    @Autowired
    private RedisService redisService;
    @Autowired
    private MovieService movieService;

    @Override
    public PageResult<MovieVO> getTop100Movie() {
        List<Object> movieIdObjectList = redisService.zReverseRange(RedisPreFixConstant.RANK_TOP100, 0, 100);
        List<MovieVO> movieVOList = getMovieVO(movieIdObjectList);
        return new PageResult<>(movieVOList, Long.parseLong(movieIdObjectList.size() + ""));
    }

    @Override
    public PageResult<MovieVO> getReputationMovie() {
        List<Object> movieIdObjectList = redisService.zReverseRange(RedisPreFixConstant.RANK_REPUTATION, 0, 100);
        List<MovieVO> movieVOList = getMovieVO(movieIdObjectList);
        return new PageResult<>(movieVOList, Long.parseLong(movieIdObjectList.size() + ""));
    }

    @Override
    public PageResult<MovieVO> getGrossMovie() {
        List<Object> movieIdObjectList = redisService.zReverseRange(RedisPreFixConstant.RANK_GROSS, 0, 100);
        List<MovieVO> movieVOList = getMovieVO(movieIdObjectList);
        return new PageResult<>(movieVOList, Long.parseLong(movieIdObjectList.size() + ""));
    }

    @Override
    public PageResult<MovieVO> getTodayGross() {
        List<Object> movieIdObjectList = redisService.zReverseRange(RedisPreFixConstant.RANK_TODAY_GROSS, 0, 10);
        List<MovieVO> movieVOList = getMovieVO(movieIdObjectList);
        return new PageResult<>(movieVOList, Long.parseLong(movieIdObjectList.size() + ""));
    }

    private List<MovieVO> getMovieVO(List<Object> movieIdObjectList) {
        long fromIndex = PageUtil.getLimitCurrent();
        long toIndex = Math.min(fromIndex + PageUtil.getSize(), movieIdObjectList.size());
        movieIdObjectList = movieIdObjectList.subList((int) fromIndex, (int) toIndex);
        List<Integer> movieIdList = movieIdObjectList.stream()
                .map(item -> (Integer) item)
                .collect(Collectors.toList());
        return movieService.getMovieVOListByMovieIdList(movieIdList);
    }
}
