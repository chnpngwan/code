package com.demo.redis.bean;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.io.Serializable;

/**
 * ProjectName:  spring boot
 * PackageName:  com.demo.redis.bean
 * ClassName:    User
 *
 * @Author chnpngwng
 * @Date 2023 06 05 15 21
 **/
@Data
@Component
public class User implements Serializable {
    private int id;
    private String name;
    private String gender;
    private int age;
    private String birthdate;
}
