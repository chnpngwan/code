package com.demo.course.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

/**
 * ProjectName:  spring boot
 * PackageName:  com.demo.course.entity
 * ClassName:    Course
 *
 * @Author chnpngwng
 * @Date 2023 06 09 08 42
 **/
@Component
@Data
public class Course {
    private String id;
    private String name;
    private String type;
    private int credit;
    private int classHour;

    public Course() {
    }

    public Course(String id, String name, String type, int credit, int classHour) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.credit = credit;
        this.classHour = classHour;
    }
}
