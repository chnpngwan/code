package com.student.service.impl;

import com.student.bean.Student;
import com.student.mappers.StudentMapper;
import com.student.service.StudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * ProjectName:  spring boot
 * PackageName:  com.student.service.impl
 * ClassName:    StudentServiceImpl
 *
 * @Author chnpngwng
 * @Date 2023 06 12 15 46
 **/

@Service
public class StudentServiceImpl implements StudentService {
    @Resource
    private StudentMapper studentMapper;

    @Override
    public List<Student> queryByName(String studentName) {
        return studentMapper.queryByName(studentName);
    }

    @Override
    public int deleteById(int id) {
        return studentMapper.deleteById(id);
    }

    @Override
    public int insert(Student student) {
        return studentMapper.insert(student);
    }
}
