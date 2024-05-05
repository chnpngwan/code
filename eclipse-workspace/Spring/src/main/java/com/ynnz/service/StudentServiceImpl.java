package com.ynnz.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ynnz.dao.StudentDao;
import com.ynnz.model.Student;
import com.ynnz.service.*;
@Service("studentService")
public class StudentServiceImpl implements StudentService{
	
	@Resource
	private StudentDao studentDao;
  //全表查询
	@Override
	public List<Student> queryStudents() {
		
		return studentDao.selectStudent();
	}
	//删除
	@Override
	public int deleteStuById(String id) {
		return studentDao.deleteStuById(id);
	}
	
	@Override
	public int addStudentInfo(Student student) {
		return studentDao.addStudentInfo(student);
	}
   
}
