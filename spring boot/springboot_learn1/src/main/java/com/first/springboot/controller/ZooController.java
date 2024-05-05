package com.first.springboot.controller;

import com.first.springboot.bean.Zoo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * ProjectName:   spring boot
 * PackageName:   com.first.springboot.controller
 * ClassName:     ZooController
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 22 14 43
 **/

@RestController
public class ZooController {
    @Resource
    private Zoo zoo;

    @GetMapping("/zoo")
    @ResponseBody
    public String zoo(){
        return zoo.toString();
    }
}
