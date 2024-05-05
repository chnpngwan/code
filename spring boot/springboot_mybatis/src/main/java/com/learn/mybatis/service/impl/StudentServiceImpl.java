package com.learn.mybatis.service.impl;

import com.learn.mybatis.mapper.StudentMapper;
import com.learn.mybatis.model.Student;
import com.learn.mybatis.service.StudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * ProjectName:   spring boot
 * PackageName:   com.learn.mybatis.service.impl
 * ClassName:     StudentServiceImpl
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 25 19 25
 **/

@Service
public class StudentServiceImpl implements StudentService {

    @Resource
    private StudentMapper studentMapper;
    @Override
    public List<Student> queryAll(String name, String age) {
        return studentMapper.queryAll(name, age);
    }

    @Override
    public int deleteById(int id) {
        return studentMapper.deleteById(id);
    }

    @Override
    public int insert(Student student) {
        return studentMapper.insert(student);
    }

    @Override
    public Student queryAllById(int id) {
        return studentMapper.queryAllById(id);
    }

    @Override
    public int updateById(Student student) {
        return studentMapper.updateById(student);
    }
}
