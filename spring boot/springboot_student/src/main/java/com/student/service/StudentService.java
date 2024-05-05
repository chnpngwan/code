package com.student.service;

import com.student.bean.Student;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * ProjectName:  spring boot
 * PackageName:  com.student.service
 * ClassName:    StudentService
 *
 * @Author chnpngwng
 * @Date 2023 06 12 15 45
 **/


public interface StudentService {
    List<Student> queryByName(String studentName);
    int deleteById(int id);
    int insert(Student student);
}
