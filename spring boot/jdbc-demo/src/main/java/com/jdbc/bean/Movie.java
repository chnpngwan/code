package com.jdbc.bean;

import lombok.Data;

import java.sql.Date;

/**
 * ProjectName:  spring boot
 * PackageName:  com.jdbc.bean
 * ClassName:    Movie
 *
 * @Author chnpngwng
 * @Date 2023 06 05 19 59
 **/

@Data
public class Movie {

    private int id;
    private String name;
    private int duration;
    private String area;
    private Date moviedate;
    private Double price;

}
