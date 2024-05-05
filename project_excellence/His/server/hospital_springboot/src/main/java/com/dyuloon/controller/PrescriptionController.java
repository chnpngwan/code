package com.dyuloon.controller;


import com.dyuloon.entity.Drugs;
import com.dyuloon.from.PrescriptionForm;
import com.dyuloon.from.SearchForm;
import com.dyuloon.service.PrescriptionService;
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
@RequestMapping("/prescription")
public class PrescriptionController {

    @Autowired
    private PrescriptionService prescriptionService;

    // 增加处方
    @PostMapping
    public ResultVO savePrescription(@RequestBody PrescriptionForm prescriptionForm) {
        ResultVO resultVO = this.prescriptionService.savePrescription(prescriptionForm);
        return resultVO;
    }

    // 医生病例分页查看
    @GetMapping
    public PageVO query(SearchForm searchForm) {
        PageVO pageVO = this.prescriptionService.queryPage(searchForm);
        return pageVO;
    }

    // 患者病例分页查看
    @GetMapping("/queryPatientCasePage")
    public PageVO queryPatientCasePage(SearchForm searchForm) {
        PageVO pageVO = this.prescriptionService.queryPatientCasePage(searchForm);
        return pageVO;
    }

    // 患者缴费分页查看
    @GetMapping("/queryPatientPayPage")
    public PageVO queryPatientPayPage(SearchForm searchForm) {
        PageVO pageVO = this.prescriptionService.queryPatientPayPage(searchForm);
        return pageVO;
    }

    // 删除病例
    @DeleteMapping("{id}")
    public ResultVO deleteCaseById(@PathVariable Integer id) {
        ResultVO resultVO = this.prescriptionService.deleteCaseById(id);
        return resultVO;
    }

    // 根据挂号id查病例
    @GetMapping("{id}")
    public ResultVO getDrugById(@PathVariable Integer id) {
        ResultVO resultVO = this.prescriptionService.getDrugById(id);
        return resultVO;
    }

    // 未缴费信息统计
    @GetMapping("/queryAdminUnpayPage")
    public PageVO queryAdminUnpayPage(SearchForm searchForm) {
        PageVO pageVO = this.prescriptionService.queryAdminUnpayPage(searchForm);
        return pageVO;
    }

}

