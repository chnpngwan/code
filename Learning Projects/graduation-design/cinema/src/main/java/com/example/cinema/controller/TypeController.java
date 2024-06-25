package com.example.cinema.controller;

import com.example.cinema.annotation.OptLog;
import com.example.cinema.entity.Type;
import com.example.cinema.service.TypeService;
import com.example.cinema.vo.PageResult;
import com.example.cinema.vo.Response;
import com.example.cinema.vo.TypeVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.example.cinema.constant.OptTypeConst.REMOVE;
import static com.example.cinema.constant.OptTypeConst.SAVE_OR_UPDATE;

@Api(tags = "类型模块")
@RestController
@RequestMapping("/type")
public class TypeController {
    @Autowired
    private TypeService typeService;

    @GetMapping
    @ApiOperation(value = "查看类型列表")
    public Response<PageResult<Type>> getTypePage(String keywords) {
        return Response.success(typeService.getTypePage(keywords));
    }

    @GetMapping("/list")
    @ApiOperation(value = "查看所有类型")
    public Response<List<TypeVO>> getTypeList() {
        return Response.success(typeService.getTypeList());
    }

    @PostMapping
    @OptLog(optType = SAVE_OR_UPDATE)
    @ApiOperation(value = "新增或修改类型")
    public Response<?> saveOrUpdateType(@RequestBody Type type) {
        if (typeService.saveOrUpdate(type)) {
            return Response.success();
        }
        return Response.failure();
    }

    @DeleteMapping
    @OptLog(optType = REMOVE)
    @ApiOperation(value = "删除类型")
    public Response<?> deleteServe(@RequestBody List<Integer> ids) {
        if (typeService.removeBatchByIds(ids)) {
            return Response.success();
        }
        return Response.failure();
    }
}
