package com.example.cinema.controller;

import com.example.cinema.dto.OperationLogDTO;
import com.example.cinema.service.OperationLogService;
import com.example.cinema.vo.OperationLogVO;
import com.example.cinema.vo.PageResult;
import com.example.cinema.vo.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@Api(tags = "日志模块")
@RestController
@RequestMapping("/log")
public class OperationLogController {
    @Resource
    private OperationLogService operationLogService;

    @GetMapping
    @ApiOperation(value = "查看操作日志")
    public Response<PageResult<OperationLogVO>> operationLogList(@Validated OperationLogDTO operationLogDTO) {
        return Response.success(operationLogService.operationLogList(operationLogDTO));
    }

    @DeleteMapping
    @ApiOperation(value = "删除操作日志")
    public Response<?> deleteOperationLogs(@RequestBody List<Integer> logIdList) {
        if (operationLogService.removeByIds(logIdList)) {
            return Response.success();
        }
        return Response.failure();
    }
}
