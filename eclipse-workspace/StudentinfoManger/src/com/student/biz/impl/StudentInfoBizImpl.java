package com.student.biz.impl;

import java.util.List;
import java.util.Map;

import com.student.dao.IStudentInfoDAO;
import com.student.dao.impl.StudentInfoDAOImpl;

public class StudentInfoBizImpl implements IStudnetInfoBiz{

	@Override
	public List<Map<String, Object>> getGrade(String s_id, String s_name, String t_name) {
		IStudentInfoDAO dao = new StudentInfoDAOImpl();
		return dao.getGrade(s_id, s_name, t_name);
	}

}
