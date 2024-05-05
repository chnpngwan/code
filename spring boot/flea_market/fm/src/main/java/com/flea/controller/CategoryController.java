package com.flea.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.flea.common.Result;
import com.flea.entity.Category;
import com.flea.service.CategoryService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    /**
     * 新增分类
     * @param category
     * @return
     */
    @PostMapping("/save")
    public Result<String> save(@RequestBody Category category){
        log.info("新增分类：{}", category);
        categoryService.save(category);
        return Result.success("新增分类成功");
    }

    /**
     * 根据id删除分类
     * @param id
     * @return
     */
    @DeleteMapping
    public Result<String> delete(Long id){
        log.info("删除id为{}的分类", id);
        categoryService.remove(id);
        return Result.success("删除分类成功");
    }

    /**
     * 根据id修改分类信息
     * @param category
     * @return
     */
    @PutMapping
    public Result<String> update(@RequestBody Category category){
        log.info("修改分类信息：{}", category);
        categoryService.updateById(category);
        return Result.success("修改分类信息成功");
    }

    /**
     * 分页
     * @param page
     * @param pageSize
     * @return
     */
    @GetMapping("/page")
    public Result<Page> page(int page, int pageSize, String name){
        //分页构造器
        Page<Category> pageInfo = new Page<>(page, pageSize);
        //条件构造器
        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotEmpty(name), Category::getName, name);
        queryWrapper.orderByAsc(Category::getSort);

        categoryService.page(pageInfo, queryWrapper);
        return Result.success(pageInfo);
    }

    /**
     * 根据id查询分类
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public Result<Category> getCategoryById(@PathVariable Long id){
        Category category = categoryService.getById(id);
        if (category != null) {
            return Result.success(category);
        }
        return Result.error("未查询到分类信息！");
    }

}
