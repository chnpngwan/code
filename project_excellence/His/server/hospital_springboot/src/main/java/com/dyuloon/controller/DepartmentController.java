package com.dyuloon.controller;


import com.dyuloon.entity.Collector;
import com.dyuloon.entity.Department;
import com.dyuloon.entity.Doctor;
import com.dyuloon.entity.customEntity.OptionEntity;
import com.dyuloon.from.SearchForm;
import com.dyuloon.service.DepartmentService;
import com.dyuloon.util.ResultVOUtil;
import com.dyuloon.vo.PageVO;
import com.dyuloon.vo.ResultVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author dyuloon
 * @since 2023-06-06
 */
@RestController
@RequestMapping("/department")
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    // 增
    @PostMapping
    public ResultVO save(@RequestBody Department department) {
        boolean save = this.departmentService.save(department);
        ResultVO resultVO = save ? ResultVOUtil.success(null,"添加成功！") : ResultVOUtil.fail("添加失败！");
        return resultVO;
    }

    // 查
    @GetMapping
    public PageVO query(SearchForm searchForm) {
        PageVO pageVO = this.departmentService.queryPage(searchForm);
        return pageVO;
    }

    // 改
    @PutMapping
    public ResultVO update(@RequestBody Department department){
        boolean update = this.departmentService.updateById(department);
        ResultVO resultVO = update ? ResultVOUtil.success(null,"更新成功！") : ResultVOUtil.fail("更新失败！");
        return resultVO;
    }

    // 删
    @DeleteMapping("{id}")
    public ResultVO delete(@PathVariable Integer id){
        boolean remove = this.departmentService.removeById(id);
        ResultVO resultVO = remove ? ResultVOUtil.success(null,"删除成功！") : ResultVOUtil.fail("删除失败！");
        return resultVO;
    }

    // 查全部
    @GetMapping("/queryAllDepartment")
    public ResultVO queryAll() {
        ResultVO resultVO = this.departmentService.getlist();
        return resultVO;
    }

    // 根据科室id查科室名字
    @GetMapping("/queryDepartmentName/{id}")
    public ResultVO queryOneDoctor(@PathVariable Integer id) {
        Department department = this.departmentService.getById(id);
        ResultVO resultVO = ResultVOUtil.success(department, "查询成功！");
        return resultVO;
    }
}

