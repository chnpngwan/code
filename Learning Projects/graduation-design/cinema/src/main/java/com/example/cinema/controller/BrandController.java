package com.example.cinema.controller;

import com.example.cinema.annotation.OptLog;
import com.example.cinema.entity.Brand;
import com.example.cinema.service.BrandService;
import com.example.cinema.vo.BrandVO;
import com.example.cinema.vo.PageResult;
import com.example.cinema.vo.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.example.cinema.constant.OptTypeConst.REMOVE;
import static com.example.cinema.constant.OptTypeConst.SAVE_OR_UPDATE;

@Api(tags = "品牌模块")
@RestController
@RequestMapping("/brand")
public class BrandController {
    @Autowired
    private BrandService brandService;

    @GetMapping
    @ApiOperation(value = "查看品牌列表")
    public Response<PageResult<Brand>> getBrandPage(String keywords) {
        return Response.success(brandService.getBrandPage(keywords));
    }

    @GetMapping("/list")
    @ApiOperation(value = "获取所有品牌")
    public Response<List<BrandVO>> getBrandList() {
        return Response.success(brandService.getBrandList());
    }

    @PostMapping
    @OptLog(optType = SAVE_OR_UPDATE)
    @ApiOperation(value = "新增或修改品牌")
    public Response<?> saveOrUpdateBrand(@RequestBody Brand brand) {
        if (brandService.saveOrUpdate(brand)) {
            return Response.success();
        }
        return Response.failure();
    }

    @DeleteMapping
    @OptLog(optType = REMOVE)
    @ApiOperation(value = "删除品牌")
    public Response<?> deleteBrand(@RequestBody List<Integer> ids) {
        if (brandService.removeBatchByIds(ids)) {
            return Response.success();
        }
        return Response.failure();
    }
}
