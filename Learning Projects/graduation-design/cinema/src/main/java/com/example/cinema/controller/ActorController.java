package com.example.cinema.controller;


import com.example.cinema.annotation.OptLog;
import com.example.cinema.entity.Actor;
import com.example.cinema.service.ActorService;
import com.example.cinema.vo.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

import static com.example.cinema.constant.OptTypeConst.REMOVE;
import static com.example.cinema.constant.OptTypeConst.SAVE_OR_UPDATE;

@Api(tags = "演员模块")
@RestController
@RequestMapping("/actor")
public class ActorController {
    @Autowired
    private ActorService actorService;

    @GetMapping
    @ApiOperation(value = "查看演员列表")
    public Response<PageResult<Actor>> getAgePage(String keywords) {
        return Response.success(actorService.getActorPage(keywords));
    }

    @GetMapping("/list")
    @ApiOperation(value = "查看所有的演员")
    public Response<List<ActorVO>> getActorList() {
        List<Actor> list = actorService.list();
        List<ActorVO> actorVOList = list.stream().map(i -> ActorVO.builder()
                .id(i.getId())
                .name(i.getName())
                .build()).collect(Collectors.toList());
        return Response.success(actorVOList);
    }

    @GetMapping("/search")
    @ApiOperation(value = "搜索演员")
    public Response<PageResult<ActorSearchVO>> search(String keywords) {
        return Response.success(actorService.search(keywords));
    }

    @GetMapping("/detail")
    @ApiOperation(value = "查看演员详情")
    public Response<ActorDetailVO> getActorDetail(Integer actorId) {
        return Response.success(actorService.getActorDetailByActorId(actorId));
    }

    @GetMapping("/popular")
    @ApiOperation(value = "查看热门影人")
    public Response<List<ActorVO>> getPopularActor() {
        return Response.success(actorService.getPopularActorList());
    }

    @PostMapping
    @OptLog(optType = SAVE_OR_UPDATE)
    @ApiOperation(value = "新增或修改演员")
    public Response<?> saveOrUpdateAge(@RequestBody Actor actor) {
        if (actorService.saveOrUpdate(actor)) {
            return Response.success();
        }
        return Response.failure();
    }

    @DeleteMapping
    @OptLog(optType = REMOVE)
    @ApiOperation(value = "删除演员")
    public Response<?> deleteAge(@RequestBody List<Integer> ids) {
        if (actorService.removeBatchByIds(ids)) {
            return Response.success();
        }
        return Response.failure();
    }
}
