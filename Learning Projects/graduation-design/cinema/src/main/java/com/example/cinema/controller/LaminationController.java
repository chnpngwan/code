package com.example.cinema.controller;

import com.example.cinema.annotation.OptLog;
import com.example.cinema.entity.Lamination;
import com.example.cinema.service.LaminationService;
import com.example.cinema.vo.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.example.cinema.constant.OptTypeConst.REMOVE;
import static com.example.cinema.constant.OptTypeConst.SAVE_OR_UPDATE;

@Api(tags = "排片模块")
@RestController
@RequestMapping("/lamination")
public class LaminationController {
    @Autowired
    private LaminationService laminationService;

    @GetMapping
    @ApiOperation(value = "查看排片列表")
    public Response<PageResult<LaminationVO>> getLaminationPage(String keywords) {
        return Response.success(laminationService.getLaminationPage(keywords));
    }

    @GetMapping("/detail")
    @ApiOperation(value = "查看排片详情")
    public Response<List<LaminationDetailVO>> getLaminationDetail(Integer cinemaId, Integer movieId) {
        return Response.success(laminationService.getLaminationDetail(cinemaId, movieId));
    }

    @GetMapping("/seats")
    @ApiOperation(value = "查看排片的座位信息")
    public Response<String> getSeats(Integer laminationId) {
        return Response.success(laminationService.getSeatsByLaminationId(laminationId));
    }

    @GetMapping("/order")
    @ApiOperation(value = "订单页面查看排片详情")
    public Response<LaminationOrderVO> getLaminationOrder(Integer laminationId) {
        return Response.success(laminationService.getLaminationOrderById(laminationId));
    }

    @PostMapping()
    @OptLog(optType = SAVE_OR_UPDATE)
    @ApiOperation(value = "新增或修改排片")
    public Response<?> saveOrUpdateLamination(@RequestBody Lamination lamination) {
        if (laminationService.saveOrUpdateLamination(lamination)) {
            return Response.success();
        }
        return Response.failure();
    }

    @DeleteMapping
    @OptLog(optType = REMOVE)
    @ApiOperation(value = "删除排片")
    public Response<?> deleteLamination(@RequestBody List<Integer> ids) {
        if (laminationService.deleteLamination(ids)) {
            return Response.success();
        }
        return Response.failure();
    }
}
