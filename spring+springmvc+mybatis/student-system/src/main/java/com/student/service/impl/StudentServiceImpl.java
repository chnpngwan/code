/**
 * @author Chnpng Wng
 * @data Apr 17, 2023
 * @time 3:40:13 PM
 */
package com.student.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.student.mapper.StudentMapper;
import com.student.model.Student;
import com.student.service.StudentService;
@Service
public class StudentServiceImpl implements StudentService{

	@Resource
	private StudentMapper studentMapper;
	
	@Override
	public List<Student> selectByAll() {
		return studentMapper.selectByAll();
	}

	@Override
	public int deleteById(String id) {
		return studentMapper.deleteById(id);
	}

	@Override
	public int insertInfo(Student student) {
		return studentMapper.insertInfo(student);
	} 

	@Override
	public int updateStudent(Student student) {
		return studentMapper.updateStudent(student);
	}

}
