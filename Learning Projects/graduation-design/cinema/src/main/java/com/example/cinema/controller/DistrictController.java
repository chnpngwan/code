package com.example.cinema.controller;

import com.example.cinema.annotation.OptLog;
import com.example.cinema.entity.District;
import com.example.cinema.service.DistrictService;
import com.example.cinema.vo.DistrictVO;
import com.example.cinema.vo.PageResult;
import com.example.cinema.vo.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.example.cinema.constant.OptTypeConst.REMOVE;
import static com.example.cinema.constant.OptTypeConst.SAVE_OR_UPDATE;

@Api(tags = "行政区模块")
@RestController
@RequestMapping("/district")
public class DistrictController {
    @Autowired
    private DistrictService districtService;

    @GetMapping
    @ApiOperation(value = "查看行政区列表")
    public Response<PageResult<District>> getDistrictPage(String keywords) {
        return Response.success(districtService.getDistrictPage(keywords));
    }

    @GetMapping("/list")
    @ApiOperation(value = "查看所有行政区")
    public Response<List<DistrictVO>> getDistrictList() {
        return Response.success(districtService.getDistrictList());
    }

    @PostMapping
    @OptLog(optType = SAVE_OR_UPDATE)
    @ApiOperation(value = "新增或修改行政区")
    public Response<?> saveOrUpdateDistrict(@RequestBody District district) {
        if (districtService.saveOrUpdate(district)) {
            return Response.success();
        }
        return Response.failure();
    }

    @DeleteMapping
    @OptLog(optType = REMOVE)
    @ApiOperation(value = "删除行政区")
    public Response<?> deleteDistrict(@RequestBody List<Integer> ids) {
        if (districtService.removeBatchByIds(ids)) {
            return Response.success();
        }
        return Response.failure();
    }
}
