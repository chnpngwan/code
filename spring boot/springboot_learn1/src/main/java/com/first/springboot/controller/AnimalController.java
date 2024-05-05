package com.first.springboot.controller;

import com.first.springboot.bean.Animal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * ProjectName:   spring boot
 * PackageName:   com.first.springboot.controller
 * ClassName:     AnimalController
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 22 14 15
 **/

@RestController
public class AnimalController {
    @Resource
    private Animal animal;

    @GetMapping("/test")
    public String getAnimal(){
        return animal.toString();
    }
}
