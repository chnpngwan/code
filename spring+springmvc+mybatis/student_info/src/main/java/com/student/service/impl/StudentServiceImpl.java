package com.student.service.impl;

import com.student.mapper.StudentMapper;
import com.student.model.Student;
import com.student.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.student.service.impl
 * ClassName:     StudentServiceImpl
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 25 18 16
 **/

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentMapper studentMapper;

    @Override
    public List<Student> selectStudent(String name) {
        return studentMapper.selectStudent(name);
    }

    @Override
    public int insert(Student student) {
        return studentMapper.insert(student);
    }

    @Override
    public int delete(int id) {
        return studentMapper.delete(id);
    }
}
