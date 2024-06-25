package com.example.cinema.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.cinema.entity.Actor;
import com.example.cinema.entity.Duty;
import com.example.cinema.entity.Movie;
import com.example.cinema.entity.MovieActorDuty;
import com.example.cinema.mapper.ActorMapper;
import com.example.cinema.mapper.DutyMapper;
import com.example.cinema.mapper.MovieActorDutyMapper;
import com.example.cinema.mapper.MovieMapper;
import com.example.cinema.service.ActorService;
import com.example.cinema.service.MovieService;
import com.example.cinema.utils.BeanCopyUtil;
import com.example.cinema.utils.PageUtil;
import com.example.cinema.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class ActorServiceImpl extends ServiceImpl<ActorMapper, Actor> implements ActorService {

    @Autowired
    private MovieActorDutyMapper movieActorDutyMapper;
    @Autowired
    private MovieMapper movieMapper;
    @Autowired
    private DutyMapper dutyMapper;
    @Autowired
    private MovieService movieService;

    @Override
    public PageResult<Actor> getActorPage(String keywords) {
        Page<Actor> page = new Page<>(PageUtil.getCurrent(), PageUtil.getSize());
        Page<Actor> actorPage = baseMapper.selectPage(page, new LambdaQueryWrapper<Actor>()
                .like(!StrUtil.isEmpty(keywords), Actor::getName, keywords)
                .or()
                .like(!StrUtil.isEmpty(keywords), Actor::getBloodType, keywords)
                .or()
                .like(!StrUtil.isEmpty(keywords), Actor::getSchool, keywords)
                .or()
                .like(!StrUtil.isEmpty(keywords), Actor::getConstellation, keywords)
                .or()
                .like(!StrUtil.isEmpty(keywords), Actor::getInformation, keywords));
        return new PageResult<>(actorPage.getRecords(), actorPage.getTotal());
    }

    @Override
    public PageResult<ActorSearchVO> search(String keywords) {
        Page<Actor> page = new Page<>(PageUtil.getCurrent(), PageUtil.getSize());
        Page<Actor> actorPage = baseMapper.selectPage(page, new LambdaQueryWrapper<Actor>()
                .like(!StrUtil.isEmpty(keywords), Actor::getName, keywords));
        List<ActorSearchVO> actorSearchVOList = actorPage.getRecords().stream().map(actor -> {
            ActorSearchVO actorSearchVO = BeanCopyUtil.copyObject(actor, ActorSearchVO.class);
            List<MovieActorDuty> movieActorDutyList = movieActorDutyMapper.selectList(new LambdaQueryWrapper<MovieActorDuty>()
                    .eq(MovieActorDuty::getActorId, actor.getId()));
            Set<Integer> movieIdSet = movieActorDutyList.stream()
                    .map(MovieActorDuty::getMovieId)
                    .collect(Collectors.toSet());
            List<MovieSimpleVO> movieSimpleVOList = movieIdSet.stream().map(movieId -> {
                Movie movie = movieMapper.selectById(movieId);
                return MovieSimpleVO.builder()
                        .id(movie.getId())
                        .name(movie.getNameCn())
                        .build();
            }).collect(Collectors.toList());
            actorSearchVO.setMovieList(movieSimpleVOList.subList(0, Math.min(3, movieSimpleVOList.size())));
            return actorSearchVO;
        }).collect(Collectors.toList());
        return new PageResult<>(actorSearchVOList, actorPage.getTotal());
    }

    @Override
    public ActorDetailVO getActorDetailByActorId(Integer actorId) {
        Actor actor = baseMapper.selectById(actorId);
        ActorDetailVO actorDetailVO = BeanCopyUtil.copyObject(actor, ActorDetailVO.class);
        List<MovieActorDuty> movieActorDutyList = movieActorDutyMapper
                .selectList(new LambdaQueryWrapper<MovieActorDuty>()
                .eq(MovieActorDuty::getActorId, actorId));
        // 获取dutyList
        Set<Integer> dutyIdSet = movieActorDutyList.stream()
                .map(MovieActorDuty::getDutyId)
                .collect(Collectors.toSet());
        List<Duty> dutyList = dutyIdSet.stream()
                .map(dutyId -> dutyMapper.selectById(dutyId))
                .collect(Collectors.toList());
        // 获取movieList
        Set<Integer> movieIdSet = movieActorDutyList.stream()
                .map(MovieActorDuty::getMovieId)
                .collect(Collectors.toSet());
        List<MovieFrontVO> movieList = movieService.getMovieFrOntVOByMovieId(new ArrayList<>(movieIdSet));
        // 获取relationshipList
        Set<Integer> relationshipIdSet = new HashSet<>();
        movieIdSet.forEach(movieId -> {
            List<MovieActorDuty> movieActorDuties = movieActorDutyMapper.selectList(new LambdaQueryWrapper<MovieActorDuty>()
                    .eq(MovieActorDuty::getMovieId, movieId));
            List<Integer> collect = movieActorDuties.stream()
                    .map(MovieActorDuty::getActorId)
                    .collect(Collectors.toList());
            relationshipIdSet.addAll(collect);
        });
        List<ActorVO> relationshipList = relationshipIdSet.stream().map(relationshipId -> {
            Actor relationshipActor = baseMapper.selectById(relationshipId);
            return BeanCopyUtil.copyObject(relationshipActor, ActorVO.class);
        }).collect(Collectors.toList());
        actorDetailVO.setDutyList(dutyList);
        actorDetailVO.setMovieList(movieList);
        actorDetailVO.setRelationshipList(relationshipList);
        return actorDetailVO;
    }

    @Override
    public List<ActorVO> getPopularActorList() {
        List<Integer> movieIdList = movieMapper.getOngoingMovieIdByCondition(0L, 5L, 0, 0, 0, 1);
        List<Integer> actorIdList = new ArrayList<>();
        boolean flag = false;
        for (Integer movieId : movieIdList) {
            if (flag) {
                break;
            }
            List<MovieActorDuty> movieActorDutyList = movieActorDutyMapper.selectList(new LambdaQueryWrapper<MovieActorDuty>()
                    .eq(MovieActorDuty::getMovieId, movieId));
            List<Integer> actorIds = movieActorDutyList.stream()
                    .map(MovieActorDuty::getActorId)
                    .collect(Collectors.toList());
            for (Integer actorId : actorIds) {
                if (actorIdList.size() <= 10) {
                    actorIdList.add(actorId);
                } else {
                    flag = true;
                    break;
                }
            }
        }
        return actorIdList.stream().map(actorId -> {
            Actor actor = baseMapper.selectById(actorId);
            return BeanCopyUtil.copyObject(actor, ActorVO.class);
        }).collect(Collectors.toList());
    }
}
