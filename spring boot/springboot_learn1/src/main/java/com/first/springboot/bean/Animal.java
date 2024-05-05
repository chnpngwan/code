package com.first.springboot.bean;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * ProjectName:   spring boot
 * PackageName:   com.first.springboot.bean
 * ClassName:     Animal
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 22 14 12
 **/
@Component
@ConfigurationProperties(prefix = "animal")
@Data
public class Animal {
    private String name;
    private String age;
    private String color;
}
