package com.medical.controller;

import com.medical.entity.History;
import com.medical.entity.Medicine;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * @author xiaobo
 * @date 2022/5/1
 */
@RestController
@RequestMapping("medicine")
public class MedicineController extends BaseController<Medicine>{

}
