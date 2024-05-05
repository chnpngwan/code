package com.learn.web.model;

import lombok.Data;

/**
 * ProjectName:   spring boot
 * PackageName:   com.leaarn.web.model
 * ClassName:     Customer
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 24 10 38
 **/

@Data
public class Customer {
    private String name;
    private int age;
    private String address;
    private String birthDate;

    public Customer(String name, int age, String address, String birthDate) {
        this.name = name;
        this.age = age;
        this.address = address;
        this.birthDate = birthDate;
    }
}
