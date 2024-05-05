package com.dyuloon.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dyuloon.entity.Department;
import com.dyuloon.entity.Doctor;
import com.dyuloon.entity.customEntity.UpdateDoctorDepartmentEntity;
import com.dyuloon.from.SearchForm;
import com.dyuloon.service.DepartmentService;
import com.dyuloon.service.DoctorService;
import com.dyuloon.util.ResultVOUtil;
import com.dyuloon.vo.PageVO;
import com.dyuloon.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

import javax.print.Doc;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author dyuloon
 * @since 2023-06-06
 */
@RestController
@RequestMapping("/doctor")
public class DoctorController {
    @Autowired
    private DoctorService doctorService;

    // 增
    @PostMapping
    public ResultVO save(@RequestBody Doctor doctor) {
        boolean save = this.doctorService.save(doctor);
        ResultVO resultVO = save ? ResultVOUtil.success(null, "添加成功！") : ResultVOUtil.fail("添加失败！");
        return resultVO;
    }

    // 查
    @GetMapping
    public PageVO query(SearchForm searchForm) {
        PageVO pageVO = this.doctorService.queryPage(searchForm);
        return pageVO;
    }

    // 改
    @PutMapping
    public ResultVO update(@RequestBody Doctor doctor) {
        boolean update = this.doctorService.updateById(doctor);
        ResultVO resultVO = update ? ResultVOUtil.success(null, "更新成功！") : ResultVOUtil.fail("更新失败！");
        return resultVO;
    }

    // 删
    @DeleteMapping("{id}")
    public ResultVO delete(@PathVariable Integer id) {
        boolean remove = this.doctorService.removeById(id);
        ResultVO resultVO = remove ? ResultVOUtil.success(null, "删除成功！") : ResultVOUtil.fail("删除失败！");
        return resultVO;
    }

    // 查一个医生
    @GetMapping("/queryOneDoctor/{id}")
    public ResultVO queryOneDoctor(@PathVariable Integer id) {
        Doctor doctor = this.doctorService.getById(id);
        ResultVO resultVO = ResultVOUtil.success(doctor, "查询成功！");
        return resultVO;
    }
    // 根据科室id查医生
    @GetMapping("/queryDepartmentDoctor")
    public PageVO queryOneDepartment(SearchForm searchForm) {
        PageVO pageVO = this.doctorService.queryOneDepartment(searchForm);
        return pageVO;
    }

    // 更改医生科室
    @PutMapping("/updateDoctorDepartment")
    public ResultVO updateDoctorDepartment(@RequestBody UpdateDoctorDepartmentEntity updateDoctorDepartmentEntity) {
        ResultVO resultVO = this.doctorService.updateDoctorDepartment(updateDoctorDepartmentEntity);
        return resultVO;
    }

}

