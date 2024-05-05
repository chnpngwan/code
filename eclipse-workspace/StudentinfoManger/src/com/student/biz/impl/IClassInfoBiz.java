package com.student.biz.impl;

import java.util.List;
import java.util.Map;

import com.student.bean.ClassInfo;
import com.student.bean.ExamInfo;
import com.student.bean.WordInfo;

public interface IClassInfoBiz {
	public Map<String, Object> findstu(String id, String name, int page, int rows);
	
	public Map<String, Object> findtea(String id, String name, int page, int rows);
	
	public List<Map<String, Object>> findBystu(String id, String name, int page, int rows);
	
	public List<Map<String, Object>> findBytea(String id, String name, int page, int rows);

	public ClassInfo joinClass(String id);

	public List<ExamInfo> findExam(String id, String s_id);
	
	public List<WordInfo> findWord(String id, String s_id);

	public int addclass(String name, String id, String starttime, String endtime, String image);

	public Map<String, Object> findpro(String e_name);
	
	public List<Map<String, Object>> getdegree(String id);

	public List<Map<String,Object>> findExam1(String id);

	public List<Map<String,Object>> findWord1(String id);

	public Map<String, Object> findpro1(String w_name);

	public Map<String, Object> findAll(String id, String name, int page, int rows);
}
