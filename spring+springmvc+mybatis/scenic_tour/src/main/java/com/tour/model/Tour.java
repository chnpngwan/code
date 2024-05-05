package com.tour.model;

import lombok.Data;

import java.util.Date;

/**
 * ProjectName:  ssm
 * PackageName:  com.tour.model
 * ClassName:    Tour
 *
 * @Author chnpngwng
 * @Date 2023 06 19 15 42
 **/

@Data
public class Tour {
    private int id;
    private String name;
    private String sex;
    private String idNo;
    private int age;
    private int type;
    private Date visitDate;
    private int visitState;
    private Date registerTime;

    public Tour() {
    }

    public Tour(int id, String name, String sex, String idNo, int age, int type, Date visitDate, int visitState, Date registerTime) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.idNo = idNo;
        this.age = age;
        this.type = type;
        this.visitDate = visitDate;
        this.visitState = visitState;
        this.registerTime = registerTime;
    }
}
