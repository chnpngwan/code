package com.first.springboot.bean;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * ProjectName:   spring boot
 * PackageName:   com.first.springboot.bean
 * ClassName:     Car
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 22 14 21
 **/
@Component
@ConfigurationProperties(prefix = "zoo")
@Data
public class Zoo {
    private String zooName;
    private List<String> zooList;

}
