package com.student.model;

import java.util.Date;

/**
 * ProjectName:   ssm
 * PackageName:   com.student.model
 * ClassName:     Student
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 25 18 15
 **/


public class Student {
    private int id;
    private String name;
    private int age;
    private String classes;
    private Date birth;

    public Student() {
        super();
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", classes='" + classes + '\'' +
                ", birth=" + birth +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getClasses() {
        return classes;
    }

    public void setClasses(String classes) {
        this.classes = classes;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }
}
