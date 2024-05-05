package com.learn.mybatis.service;

import com.learn.mybatis.model.Student;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * ProjectName:   spring boot
 * PackageName:   com.learn.mybatis.service
 * ClassName:     StudentService
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 25 19 24
 **/


public interface StudentService {

    public List<Student> queryAll(String name, String age);
    public int deleteById(int id);
    public int insert(Student student);
    public Student queryAllById(int id);
    public int updateById(Student student);
}
