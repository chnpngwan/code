package com.example.cinema.controller;

import com.example.cinema.annotation.OptLog;
import com.example.cinema.entity.Area;
import com.example.cinema.service.AreaService;
import com.example.cinema.vo.AreaVO;
import com.example.cinema.vo.PageResult;
import com.example.cinema.vo.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

import static com.example.cinema.constant.OptTypeConst.REMOVE;
import static com.example.cinema.constant.OptTypeConst.SAVE_OR_UPDATE;

@Api(tags = "区域模块")
@RestController
@RequestMapping("/area")
public class AreaController {
    @Autowired
    private AreaService areaService;

    @GetMapping
    @ApiOperation(value = "查看区域列表")
    public Response<PageResult<Area>> getAreaPage(String keywords) {
        return Response.success(areaService.getAreaPage(keywords));
    }

    @GetMapping("/list")
    @ApiOperation(value = "查看所有区域列表")
    public Response<List<AreaVO>> getAreaList() {
        List<AreaVO> areaVOList = areaService.list().stream()
                .map(i -> AreaVO.builder()
                        .id(i.getId())
                        .name(i.getName())
                        .build())
                .collect(Collectors.toList());
        return Response.success(areaVOList);
    }

    @PostMapping
    @OptLog(optType = SAVE_OR_UPDATE)
    @ApiOperation(value = "新增或修改区域")
    public Response<?> saveOrUpdateAge(@RequestBody Area area) {
        if (areaService.saveOrUpdate(area)) {
            return Response.success();
        }
        return Response.failure();
    }

    @DeleteMapping
    @OptLog(optType = REMOVE)
    @ApiOperation(value = "删除区域")
    public Response<?> deleteAge(@RequestBody List<Integer> ids) {
        if (areaService.removeBatchByIds(ids)) {
            return Response.success();
        }
        return Response.failure();
    }
}
