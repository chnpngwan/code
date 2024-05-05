package com.first.springboot.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * ProjectName:   spring boot
 * PackageName:   com.first.springboot.controller
 * ClassName:     HelloWord
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 18 20 08
 **/

@RestController
public class HelloWord {
    @RequestMapping("/hello")
    public String hello(){
        return "hello";
    }
}
