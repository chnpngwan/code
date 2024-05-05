/**
 * @author Chnpng Wng
 * @data Apr 17, 2023
 * @time 3:36:42 PM
 */
package com.student.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import com.student.model.Student;

public interface StudentService {
	//全表查询
	List<Student> selectByAll();
	//根据ID删除
	int deleteById(String id);
	//添加学生信息
	int insertInfo(Student student);
	//修改学生信息
	int updateStudent(Student student);
}
