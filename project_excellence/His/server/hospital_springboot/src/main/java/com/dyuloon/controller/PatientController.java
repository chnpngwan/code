package com.dyuloon.controller;


import com.dyuloon.entity.Doctor;
import com.dyuloon.entity.Patient;
import com.dyuloon.entity.UserAdmin;
import com.dyuloon.from.SearchForm;
import com.dyuloon.service.CollectorService;
import com.dyuloon.service.PatientService;
import com.dyuloon.util.ResultVOUtil;
import com.dyuloon.vo.PageVO;
import com.dyuloon.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author dyuloon
 * @since 2023-06-06
 */
@RestController
@RequestMapping("/patient")
public class PatientController {
    @Autowired
    private PatientService patientService;

    // 增
    @PostMapping
    public ResultVO save(@RequestBody Patient patient) {
        boolean save = this.patientService.save(patient);
        ResultVO resultVO = save ? ResultVOUtil.success(null, "添加成功！") : ResultVOUtil.fail("添加失败！");
        return resultVO;
    }

    // 查
    @GetMapping
    public PageVO query(SearchForm searchForm) {
        PageVO pageVO = this.patientService.queryPage(searchForm);
        return pageVO;
    }

    // 改
    @PutMapping
    public ResultVO update(@RequestBody Patient patient) {
        boolean update = this.patientService.updateById(patient);
        ResultVO resultVO = update ? ResultVOUtil.success(null, "更新成功！") : ResultVOUtil.fail("更新失败！");
        return resultVO;
    }

    // 删
    @DeleteMapping("{id}")
    public ResultVO delete(@PathVariable Integer id) {
        boolean remove = this.patientService.removeById(id);
        ResultVO resultVO = remove ? ResultVOUtil.success(null, "删除成功！") : ResultVOUtil.fail("删除失败！");
        return resultVO;
    }

    // 根据id查患者
    @GetMapping("findPatientById/{id}")
    public ResultVO query(@PathVariable Integer id) {
        Patient patient = this.patientService.getById(id);
        ResultVO resultVO = ResultVOUtil.success(patient, "查询成功！");
        return resultVO;
    }

}

