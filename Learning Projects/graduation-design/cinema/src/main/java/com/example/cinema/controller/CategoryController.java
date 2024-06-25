package com.example.cinema.controller;

import com.example.cinema.annotation.OptLog;
import com.example.cinema.entity.Category;
import com.example.cinema.service.CategoryService;
import com.example.cinema.vo.CategoryVO;
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

@Api(tags = "分类模块")
@RestController
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    @GetMapping
    @ApiOperation(value = "查看分类列表")
    public Response<PageResult<Category>> getCategoryPage(String keywords) {
        return Response.success(categoryService.getCategoryPage(keywords));
    }

    @GetMapping("/list")
    @ApiOperation(value = "查看所有分类")
    public Response<List<CategoryVO>> getCategoryList() {
        List<CategoryVO> categoryVOList = categoryService.list().stream()
                .map(i -> CategoryVO.builder()
                        .id(i.getId())
                        .name(i.getName())
                        .build())
                .collect(Collectors.toList());
        return Response.success(categoryVOList);
    }

    @PostMapping
    @OptLog(optType = SAVE_OR_UPDATE)
    @ApiOperation(value = "新增或修改分类")
    public Response<?> saveOrUpdateAge(@RequestBody Category category) {
        if (categoryService.saveOrUpdate(category)) {
            return Response.success();
        }
        return Response.failure();
    }

    @DeleteMapping
    @OptLog(optType = REMOVE)
    @ApiOperation(value = "删除分类")
    public Response<?> deleteAge(@RequestBody List<Integer> ids) {
        if (categoryService.removeBatchByIds(ids)) {
            return Response.success();
        }
        return Response.failure();
    }
}
