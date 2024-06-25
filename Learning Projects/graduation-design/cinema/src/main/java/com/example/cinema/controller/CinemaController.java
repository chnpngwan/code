package com.example.cinema.controller;

import com.example.cinema.annotation.OptLog;
import com.example.cinema.dto.CinemaServeDTO;
import com.example.cinema.entity.Cinema;
import com.example.cinema.service.CinemaService;
import com.example.cinema.vo.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.example.cinema.constant.OptTypeConst.REMOVE;
import static com.example.cinema.constant.OptTypeConst.SAVE_OR_UPDATE;

@Api(tags = "影院模块")
@RestController
@RequestMapping("/cinema")
public class CinemaController {
    @Autowired
    private CinemaService cinemaService;

    @GetMapping
    @ApiOperation(value = "查看影院列表")
    public Response<PageResult<CinemaVO>> getCinemaPage(String keywords) {
        return Response.success(cinemaService.getCinemaPage(keywords));
    }

    @GetMapping("/list")
    @ApiOperation(value = "查看所有影院")
    public Response<List<CinemaSimpleVO>> getCinemaList() {
        return Response.success(cinemaService.getCinemaList());
    }

    @GetMapping("/query")
    @ApiOperation(value = "影院条件筛选")
    public Response<PageResult<CinemaFrontVO>> getCinemaPageByCondition(
            @RequestParam("brandId") Integer brandId,
            @RequestParam("districtId") Integer districtId,
            @RequestParam("typeId") Integer typeId,
            @RequestParam("serveId") Integer serveId) {
        return Response.success(cinemaService.getCinemaPageByCondition(brandId, districtId, typeId, serveId));
    }

    @GetMapping("/search")
    @ApiOperation(value = "影院搜索")
    public Response<PageResult<CinemaFrontVO>> search(String keywords) {
        return Response.success(cinemaService.search(keywords));
    }

    @GetMapping("/detail")
    @ApiOperation(value = "查看影院详情")
    public Response<CinemaDetailVO> getCinemaDetail(Integer cinemaId) {
        return Response.success(cinemaService.getCinemaDetailByCinemaId(cinemaId));
    }

    @PostMapping
    @OptLog(optType = SAVE_OR_UPDATE)
    @ApiOperation(value = "新增或修改影院")
    public Response<?> saveOrUpdateCinema(@RequestBody Cinema cinema) {
        if (cinemaService.saveOrUpdate(cinema)) {
            return Response.success();
        }
        return Response.failure();
    }

    @DeleteMapping
    @OptLog(optType = REMOVE)
    @ApiOperation(value = "删除影院")
    public Response<?> deleteCinema(@RequestBody List<Integer> ids) {
        if (cinemaService.removeBatchByIds(ids)) {
            return Response.success();
        }
        return Response.failure();
    }

    @GetMapping("/serve")
    @ApiOperation(value = "查看影院服务")
    public Response<List<CinemaServeVO>> getCinemaServe(Integer cinemaId) {
        return Response.success(cinemaService.getCinemaServe(cinemaId));
    }

    @PostMapping("/serve")
    @OptLog(optType = SAVE_OR_UPDATE)
    @ApiOperation(value = "新增或修改影院服务")
    public Response<?> saveOrUpdateCinemaServe(@RequestBody CinemaServeDTO cinemaServeDTO) {
        if (cinemaService.saveOrUpdateCinemaServe(cinemaServeDTO)) {
            return Response.success();
        }
        return Response.failure();
    }

    @DeleteMapping("/serve")
    @OptLog(optType = REMOVE)
    @ApiOperation(value = "删除影院服务")
    public Response<?> deleteCinemaServe(@RequestBody List<Integer> ids) {
        if (cinemaService.deleteCinemaServe(ids)) {
            return Response.success();
        }
        return Response.failure();
    }

    @GetMapping("/hall")
    @ApiOperation(value = "查看影院影厅")
    public Response<List<CinemaHallVO>> getCinemaHall(Integer cinemaId) {
        return Response.success(cinemaService.getCinemaHall(cinemaId));
    }
}
