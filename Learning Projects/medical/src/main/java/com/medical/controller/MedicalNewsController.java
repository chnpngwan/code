package com.medical.controller;

import com.medical.entity.MedicalNews;
import com.medical.entity.Medicine;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * @author xiaobo
 * @date 2022/5/1
 */
@RestController
@RequestMapping("medical_news")
public class MedicalNewsController extends BaseController<MedicalNews>{


}
