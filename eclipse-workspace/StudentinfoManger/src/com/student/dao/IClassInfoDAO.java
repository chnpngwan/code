package com.student.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.student.bean.ClassInfo;
import com.student.bean.ExamInfo;
import com.student.bean.WordInfo;
import com.student.bean.problemsInfo;


public interface IClassInfoDAO {
	public List<Map<String, Object>> findstu(String id, String name, int page, int rows);
	
	public List<Map<String, Object>> findtea(String id, String name, int page, int rows);
	
	public int totalstu(String id, String name);
	
	public int totaltea(String id, String name);

	public ClassInfo joinClass(String id);

	public List<ExamInfo> findExam(String id, String s_id);

	public List<WordInfo> findWord(String id, String s_id);

	public int addclass(String name, String t_id, String starttime, String endtime, String image);

	public int addTopic(List<List<Object>> list, String topic, String time) throws SQLException ;

	public int addExam(String e_name, String id, String starttime, String endtime, String time, String degree);

	public int addWord(String e_name, String id, String starttime, String endtime, String degree);

	public List<problemsInfo> findpro(String e_name);

	public int totalpro(String e_name);

	public int getexamdegree(String s_id, String e_name, String degree,String id);
	
	public int getworddegree(String s_id, String e_name, String degree,String id);
	
	public List<Map<String, Object>> getexamdegree(String id);
	
	public List<Map<String, Object>> getworddegree(String id);

	public List<Map<String,Object>> findExam1(String id);

	public List<Map<String,Object>> findWord1(String id);

	public Object totalpro1(String w_name);

	public Object findpro1(String w_name);

	public int totalAll(String id, String name);

	public List<Map<String,Object>> findAll(String id, String name, int page, int rows);
	
	public List<Map<String,Object>> baobiao(String s_id, String id);

	public List<Map<String, Object>> baobiao1(String valueOf, String valueOf2);
}
