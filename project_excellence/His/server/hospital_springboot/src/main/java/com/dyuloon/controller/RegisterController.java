package com.dyuloon.controller;


import com.dyuloon.entity.Patient;
import com.dyuloon.entity.Register;
import com.dyuloon.from.SearchForm;
import com.dyuloon.service.PatientService;
import com.dyuloon.service.RegisterService;
import com.dyuloon.util.ResultVOUtil;
import com.dyuloon.vo.PageVO;
import com.dyuloon.vo.ResultVO;
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
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    private RegisterService registerService;

    // 增
    @PostMapping
    public ResultVO save(@RequestBody Register register) {
        boolean save = this.registerService.save(register);
        ResultVO resultVO = save ? ResultVOUtil.success(null, "添加成功！") : ResultVOUtil.fail("添加失败！");
        return resultVO;
    }

    // 查患者分页
    @GetMapping
    public PageVO query(SearchForm searchForm) {
        PageVO pageVO = this.registerService.queryPage(searchForm);
        return pageVO;
    }

    // 查医生分页
    @GetMapping("/queryDoctorPage")
    public PageVO queryDoctorPage(SearchForm searchForm) {
        PageVO pageVO = this.registerService.queryDoctorPage(searchForm);
        return pageVO;
    }

    // 查处方分页
    @GetMapping("/queryPrescriptionPage")
    public PageVO queryPrescriptionPage(SearchForm searchForm) {
        PageVO pageVO = this.registerService.queryPrescriptionPage(searchForm);
        return pageVO;
    }

    // 改
    @PutMapping
    public ResultVO update(@RequestBody Register register) {
        boolean update = this.registerService.updateById(register);
        ResultVO resultVO = update ? ResultVOUtil.success(null, "更新成功！") : ResultVOUtil.fail("更新失败！");
        return resultVO;
    }

    // 删
    @DeleteMapping("{id}")
    public ResultVO delete(@PathVariable Integer id) {
        boolean remove = this.registerService.removeById(id);
        ResultVO resultVO = remove ? ResultVOUtil.success(null, "取消成功！") : ResultVOUtil.fail("取消失败！");
        return resultVO;
    }

    // 根据科室查医生
    @GetMapping("{id}")
    public ResultVO findDoctor(@PathVariable Integer id) {
        ResultVO resultVO = this.registerService.findDoctor(id);
        return resultVO;
    }

    // 更改挂号状态
    @PutMapping("/stateChange/{id}")
    public ResultVO stateChange(@PathVariable Integer id) {
        ResultVO resultVO = this.registerService.stateChange(id);
        return resultVO;
    }

}

