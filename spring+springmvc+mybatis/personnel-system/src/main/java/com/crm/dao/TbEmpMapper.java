package com.crm.dao;

import com.crm.entity.TbEmp;
import com.crm.entity.Tb_emp_dept;

import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.crm.dao
 * ClassName:     TbEmpMapper
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 24 10 29
 **/
public interface TbEmpMapper {
    int deleteByPrimaryKey(Integer empId);

    int insert(TbEmp record);

    TbEmp selectByPrimaryKey(Integer empId);

    List<TbEmp> selectAll();

    int updateByPrimaryKey(TbEmp record);

    //多表连查
    List<Tb_emp_dept> selectEmp();
    //模糊查询
    List<Tb_emp_dept> selectEmpLike(Tb_emp_dept tb_emp_dept);

}
