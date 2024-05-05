package com.szpx.service.software.impl;

import com.szpx.entity.software.StudentDetailInfo;
import com.szpx.entity.software.StudentInfo;
import com.szpx.mapper.software.StudentMapper;
import com.szpx.service.software.StudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class StudentServiceImpl implements StudentService {

    @Resource
    StudentMapper studentMapper;

    @Override
    public StudentInfo getStudentInfoById(long id) {
        return studentMapper.getStudentInfoById(id);
    }

    @Override
    public StudentDetailInfo getStudentDetailInfoByStudentId(long stuId) {
        return studentMapper.getStudentDetailInfoByStudentId(stuId);
    }

    @Override
    public int stuUpdateProjectUrl(String projectUrl, long stuId) {
        return studentMapper.stuUpdateProjectUrl(projectUrl, stuId);
    }

    @Override
    public StudentInfo getStudentUrlById(long stuId) {
        return studentMapper.getStudentUrlById(stuId);
    }
}
