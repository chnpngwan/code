package com.ynnz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ynnz.model.Student;

public interface StudentDao {
    //全表查询
	List<Student>  selectStudent();
	//添加信息
	int deleteStuById(@Param("id") String id);
	//删除信息
	int addStudentInfo(Student student);
}
