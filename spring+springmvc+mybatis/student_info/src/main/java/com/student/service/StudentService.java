package com.student.service;

import com.student.model.Student;

import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.student.service
 * ClassName:     StudentService
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 25 18 16
 **/


public interface StudentService {
    List<Student> selectStudent(String name);
    int insert(Student student);
    int delete(int id);
}
