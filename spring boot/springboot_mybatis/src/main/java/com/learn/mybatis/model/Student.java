package com.learn.mybatis.model;

import lombok.Data;

/**
 * ProjectName:   spring boot
 * PackageName:   com.learn.mybatis.model
 * ClassName:     Student
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 25 19 19
 **/

@Data
public class Student {
    private int id;
    private String name;
    private int age;
    private String sex;
    private String address;

}
