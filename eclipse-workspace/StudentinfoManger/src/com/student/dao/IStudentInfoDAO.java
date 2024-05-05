package com.student.dao;

import java.util.List;
import java.util.Map;

public interface IStudentInfoDAO {
	public List<Map<String, Object>> getGrade(String s_id, String s_name, String t_name);
}
