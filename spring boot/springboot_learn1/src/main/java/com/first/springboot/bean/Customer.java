package com.first.springboot.bean;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * ProjectName:   spring boot
 * PackageName:   com.first.springboot.bean
 * ClassName:     Customer
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 22 15 45
 **/

@Component
@ConfigurationProperties(prefix = "customer" )
@Data
public class Customer {
    private String customerId;
    private String customerName;
    private int customerAge;
    private String customerDescription;
}
