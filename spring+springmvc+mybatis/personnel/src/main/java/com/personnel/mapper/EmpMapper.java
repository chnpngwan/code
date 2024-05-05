package com.personnel.mapper;

import com.personnel.model.Dept;
import com.personnel.model.Emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.personnel.mapper
 * ClassName:     EmpMapper
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 23 18 35
 **/
public interface EmpMapper {
    //查询全部
    List<Emp> select(@Param("empPosition") String empPosition,@Param("empName") String empName);
    int deleteById(@Param("empId") int empId);
    int insert(Emp emp);
}
