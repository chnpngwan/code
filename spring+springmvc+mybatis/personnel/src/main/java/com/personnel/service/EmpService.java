package com.personnel.service;

import com.personnel.model.Emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.personnel.service
 * ClassName:     EmpService
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 23 19 00
 **/
public interface EmpService {

    List<Emp> select(String empPosition, String empName);
    int deleteById(int empId);
    int insert(Emp emp);
}
