package com.dyuloon.controller;


import com.dyuloon.entity.Patient;
import com.dyuloon.entity.Prescription;
import com.dyuloon.service.PrescriptionDrugService;
import com.dyuloon.service.PrescriptionService;
import com.dyuloon.util.ResultVOUtil;
import com.dyuloon.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author dyuloon
 * @since 2023-07-26
 */
@RestController
@RequestMapping("/prescriptionDrug")
public class PrescriptionDrugController {

}

