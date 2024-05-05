package com.ynnz.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ynnz.model.Student;

public interface StudentService {
   //全表查询
	List<Student>  queryStudents();
	//添加信息
	int deleteStuById(String id);
	//删除信息
	int addStudentInfo(Student student);
	
}
