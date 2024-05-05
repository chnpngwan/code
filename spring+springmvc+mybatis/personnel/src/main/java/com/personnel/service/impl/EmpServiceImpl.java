package com.personnel.service.impl;

import com.personnel.mapper.EmpMapper;
import com.personnel.model.Emp;
import com.personnel.service.EmpService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.personnel.service.impl
 * ClassName:     EmpServiceImpl
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 23 19 01
 **/
@Service
public class EmpServiceImpl implements EmpService {
    @Resource
    private EmpMapper empMapper;

    @Override
    public List<Emp> select(String empPosition, String empName) {
        return empMapper.select(empPosition, empName);
    }

    @Override
    public int deleteById(int empId) {
        return empMapper.deleteById(empId);
    }

    @Override
    public int insert(Emp emp) {
        return empMapper.insert(emp);
    }
}
