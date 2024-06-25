package com.example.cinema.controller;

import com.example.cinema.annotation.OptLog;
import com.example.cinema.dto.ResourceDTO;
import com.example.cinema.service.ResourceService;
import com.example.cinema.vo.LabelOptionVO;
import com.example.cinema.vo.ResourceVO;
import com.example.cinema.vo.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

import static com.example.cinema.constant.OptTypeConst.REMOVE;
import static com.example.cinema.constant.OptTypeConst.SAVE_OR_UPDATE;

@Api(tags = "资源模块")
@RestController
@RequestMapping("/resource")
public class ResourceController {
    @Autowired
    private ResourceService resourceService;

    @GetMapping
    @ApiOperation(value = "查看资源列表")
    public Response<List<ResourceVO>> resourceList(String keywords) {
        return Response.success(resourceService.resourceList(keywords));
    }

    @PostMapping
    @OptLog(optType = SAVE_OR_UPDATE)
    @ApiOperation(value = "新增或修改资源")
    public Response<?> saveOrUpdateResource(@RequestBody @Valid ResourceDTO resourceDTO) {
        resourceService.saveOrUpdateResource(resourceDTO);
        return Response.success();
    }

    @DeleteMapping("/{resourceId}")
    @OptLog(optType = REMOVE)
    @ApiOperation(value = "删除资源")
    public Response<?> deleteResource(@PathVariable("resourceId") Integer resourceId) {
        resourceService.deleteResource(resourceId);
        return Response.success();
    }


    @GetMapping("/role")
    @ApiOperation(value = "查看角色资源选项")
    public Response<List<LabelOptionVO>> resourceOptionList() {
        return Response.success(resourceService.resourceOptionList());
    }
}
