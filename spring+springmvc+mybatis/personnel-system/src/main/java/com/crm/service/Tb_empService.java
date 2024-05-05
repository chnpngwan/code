package com.crm.service;

import com.crm.entity.TbEmp;
import com.crm.entity.Tb_emp_dept;

import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.crm.service.impl
 * ClassName:     Tb_empService
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 24 10 32
 **/
public interface Tb_empService {
    //查询
    List<Tb_emp_dept> selectAll(Tb_emp_dept tb_emp_dept);
    //添加
    int add(TbEmp tbEmp);
    int delete(int id);
}
