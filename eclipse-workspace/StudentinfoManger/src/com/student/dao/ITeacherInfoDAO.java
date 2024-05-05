package com.student.dao;

import java.util.List;
import java.util.Map;

public interface ITeacherInfoDAO {
	public List<Map<String, Object>> getGradeList(String t_id, String s_name, String s_id, String name, String c_name, String order);
	
	public int updateGrade(String t_id, String degree);

	public int delete(String s_id, String id);
	
	public Map<String, Object> findexam(String id);
	
	public Map<String, Object> findword(String id);

	public int add(String valueOf, String id);

	public int addgrade(String valueOf, String s_id, String degree);
}
