package com.example.cinema.controller;

import com.example.cinema.annotation.OptLog;
import com.example.cinema.entity.Duty;
import com.example.cinema.service.DutyService;
import com.example.cinema.vo.PageResult;
import com.example.cinema.vo.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.example.cinema.constant.OptTypeConst.REMOVE;
import static com.example.cinema.constant.OptTypeConst.SAVE_OR_UPDATE;

@Api(tags = "职务模块")
@RestController
@RequestMapping("/duty")
public class DutyController {
    @Autowired
    private DutyService dutyService;

    @GetMapping
    @ApiOperation(value = "查看职务列表")
    public Response<PageResult<Duty>> getDutyPage(String keywords) {
        return Response.success(dutyService.getDutyPage(keywords));
    }

    @GetMapping("/list")
    @ApiOperation(value = "获取所有职务")
    public Response<List<Duty>> getDutyList() {
        return Response.success(dutyService.list());
    }

    @PostMapping
    @OptLog(optType = SAVE_OR_UPDATE)
    @ApiOperation(value = "新增或修改职务")
    public Response<?> saveOrUpdateAge(@RequestBody Duty duty) {
        if (dutyService.saveOrUpdate(duty)) {
            return Response.success();
        }
        return Response.failure();
    }

    @DeleteMapping
    @OptLog(optType = REMOVE)
    @ApiOperation(value = "删除职务")
    public Response<?> deleteAge(@RequestBody List<Integer> ids) {
        if (dutyService.removeBatchByIds(ids)) {
            return Response.success();
        }
        return Response.failure();
    }
}
