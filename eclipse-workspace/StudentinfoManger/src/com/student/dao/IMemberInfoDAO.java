package com.student.dao;

import com.student.bean.AdminInfo;
import com.student.bean.StudentInfo;
import com.student.bean.TeacherInfo;

public interface IMemberInfoDAO {
	public StudentInfo login(StudentInfo s);
	
	public TeacherInfo login(TeacherInfo t);
	
	public AdminInfo login(AdminInfo a);
}
