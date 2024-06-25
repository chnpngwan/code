package com.example.cinema.controller;

import com.example.cinema.annotation.OptLog;
import com.example.cinema.dto.HallStateDTO;
import com.example.cinema.dto.HallSeatDTO;
import com.example.cinema.entity.Hall;
import com.example.cinema.service.HallService;
import com.example.cinema.vo.HallSimpleVO;
import com.example.cinema.vo.HallVO;
import com.example.cinema.vo.PageResult;
import com.example.cinema.vo.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.example.cinema.constant.OptTypeConst.*;

@Api(tags = "影厅模块")
@RestController
@RequestMapping("/hall")
public class HallController {
    @Autowired
    private HallService hallService;

    @GetMapping
    @ApiOperation(value = "获取所有影厅")
    public Response<PageResult<HallVO>> getHallPage(String keywords) {
        return Response.success(hallService.getHallPage(keywords));
    }

    @GetMapping("/list")
    @ApiOperation(value = "查看影院下的所有影厅")
    public Response<List<HallSimpleVO>> getHallList(Integer cinemaId) {
        return Response.success(hallService.getHallList(cinemaId));
    }

    @PostMapping
    @OptLog(optType = SAVE_OR_UPDATE)
    @ApiOperation(value = "新增或修改影厅")
    public Response<?> saveOrUpdateHall(@RequestBody Hall hall) {
        if (hallService.saveOrUpdateHall(hall)) {
            return Response.success();
        }
        return Response.failure();
    }

    @PutMapping("/seat")
    @OptLog(optType = UPDATE)
    @ApiOperation(value = "修改影厅座位")
    public Response<?> updateSeatById(@RequestBody HallSeatDTO hallSeatDTO) {
        if (hallService.updateSeatById(hallSeatDTO)) {
            return Response.success();
        }
        return Response.failure();
    }

    @PutMapping("/state")
    @OptLog(optType = UPDATE)
    @ApiOperation(value = "修改影厅可用状态")
    public Response<?> updateStateById(@RequestBody HallStateDTO hallStateDTO) {
        if (hallService.updateStateById(hallStateDTO)) {
            return Response.success();
        }
        return Response.failure();
    }

    @DeleteMapping
    @OptLog(optType = REMOVE)
    @ApiOperation(value = "删除影厅")
    public Response<?> deleteHall(@RequestBody List<Integer> ids) {
        if (hallService.removeBatchByIds(ids)) {
            return Response.success();
        }
        return Response.failure();
    }
}
