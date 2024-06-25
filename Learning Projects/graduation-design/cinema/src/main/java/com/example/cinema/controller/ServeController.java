package com.example.cinema.controller;

import com.example.cinema.annotation.OptLog;
import com.example.cinema.entity.Serve;
import com.example.cinema.service.ServeService;
import com.example.cinema.vo.PageResult;
import com.example.cinema.vo.Response;
import com.example.cinema.vo.ServeVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.example.cinema.constant.OptTypeConst.REMOVE;
import static com.example.cinema.constant.OptTypeConst.SAVE_OR_UPDATE;

@Api(tags = "服务模块")
@RestController
@RequestMapping("/serve")
public class ServeController {
    @Autowired
    private ServeService serveService;

    @GetMapping
    @ApiOperation(value = "查看服务列表")
    public Response<PageResult<Serve>> getServePage(String keywords) {
        return Response.success(serveService.getServePage(keywords));
    }

    @GetMapping("/list")
    @ApiOperation(value = "查看所有服务")
    public Response<List<ServeVO>> getServeList() {
        return Response.success(serveService.getServeList());
    }

    @PostMapping
    @OptLog(optType = SAVE_OR_UPDATE)
    @ApiOperation(value = "新增或修改服务")
    public Response<?> saveOrUpdateServe(@RequestBody Serve serve) {
        if (serveService.saveOrUpdate(serve)) {
            return Response.success();
        }
        return Response.failure();
    }

    @DeleteMapping
    @OptLog(optType = REMOVE)
    @ApiOperation(value = "删除服务")
    public Response<?> deleteServe(@RequestBody List<Integer> ids) {
        if (serveService.removeBatchByIds(ids)) {
            return Response.success();
        }
        return Response.failure();
    }
}
