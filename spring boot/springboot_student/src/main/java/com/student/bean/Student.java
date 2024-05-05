package com.student.bean;

import lombok.Data;
import org.springframework.stereotype.Component;

/**
 * ProjectName:  spring boot
 * PackageName:  com.student.bean
 * ClassName:    Student
 *
 * @Author chnpngwng
 * @Date 2023 06 12 15 34
 **/
@Data
@Component
public class Student {
    private int id;
    private String studentName;
    private int studentNo;
    private int age;
    private String gender;
    private String major;
    private String grade;

    public Student() {
    }

    public Student(int id, String studentName, int studentNo, int age, String gender, String major, String grade) {
        this.id = id;
        this.studentName = studentName;
        this.studentNo = studentNo;
        this.age = age;
        this.gender = gender;
        this.major = major;
        this.grade = grade;
    }
}
