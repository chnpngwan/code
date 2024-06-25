package com.example.cinema.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.cinema.entity.Actor;
import com.example.cinema.vo.ActorDetailVO;
import com.example.cinema.vo.ActorSearchVO;
import com.example.cinema.vo.ActorVO;
import com.example.cinema.vo.PageResult;

import java.util.List;

public interface ActorService extends IService<Actor> {
    PageResult<Actor> getActorPage(String keywords);
    PageResult<ActorSearchVO> search(String keywords);
    ActorDetailVO getActorDetailByActorId(Integer actorId);
    List<ActorVO> getPopularActorList();
}
