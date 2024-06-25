package com.example.cinema.controller;

import com.example.cinema.annotation.OptLog;
import com.example.cinema.entity.Age;
import com.example.cinema.service.AgeService;
import com.example.cinema.vo.AgeVO;
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

@Api(tags = "年代模块")
@RestController
@RequestMapping("/age")
public class AgeController {
    @Autowired
    private AgeService ageService;

    @GetMapping
    @ApiOperation(value = "查看年代列表")
    public Response<PageResult<Age>> getAgePage(String keywords) {
        return Response.success(ageService.getAgePage(keywords));
    }

    @GetMapping("/list")
    @ApiOperation(value = "查看所有年代列表")
    public Response<List<AgeVO>> getAgeList() {
        List<AgeVO> ageVOList = ageService.list().stream()
                .map(i -> AgeVO.builder()
                        .id(i.getId())
                        .name(i.getName())
                        .build())
                .collect(Collectors.toList());
        return Response.success(ageVOList);
    }

    @PostMapping
    @OptLog(optType = SAVE_OR_UPDATE)
    @ApiOperation(value = "新增或修改年代")
    public Response<?> saveOrUpdateAge(@RequestBody Age age) {
        if (ageService.saveOrUpdate(age)) {
            return Response.success();
        }
        return Response.failure();
    }

    @DeleteMapping
    @OptLog(optType = REMOVE)
    @ApiOperation(value = "删除年代")
    public Response<?> deleteAge(@RequestBody List<Integer> ids) {
        if (ageService.removeBatchByIds(ids)) {
            return Response.success();
        }
        return Response.failure();
    }
}
