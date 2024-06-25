package com.example.cinema.controller;

import com.example.cinema.service.RankService;
import com.example.cinema.vo.MovieVO;
import com.example.cinema.vo.PageResult;
import com.example.cinema.vo.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(tags = "排行榜模块")
@RestController
@RequestMapping("/rank")
public class RankController {
    @Autowired
    private RankService rankService;

    @GetMapping("/reputation")
    @ApiOperation(value = "查看热映口碑榜")
    public Response<PageResult<MovieVO>> getReputation() {
        return Response.success(rankService.getReputationMovie());
    }

    @GetMapping("/top100")
    @ApiOperation(value = "查看Top100榜")
    public Response<PageResult<MovieVO>> getTop100() {
        return Response.success(rankService.getTop100Movie());
    }

    @GetMapping("/gross")
    @ApiOperation(value = "查看国内票房榜")
    public Response<PageResult<MovieVO>> getGross() {
        return Response.success(rankService.getGrossMovie());
    }

    @GetMapping("/today")
    @ApiOperation(value = "查看今日票房榜")
    public Response<PageResult<MovieVO>> getTodayGross() {
        return Response.success(rankService.getTodayGross());
    }
}
