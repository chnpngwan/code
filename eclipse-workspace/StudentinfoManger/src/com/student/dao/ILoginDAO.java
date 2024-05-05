package com.student.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ILoginDAO {
	// 注册
	public int Login(String username, String eamil, String tel, String cardid, String sex, String pwd);
	
	// 添加题库
	public int addTopic(List<List<Object>> list, String topic, String time) throws SQLException ;

	public int updatestupwd(String name, String oldpwd, String newpwd);

	public int updateteapwd(String name, String oldpwd, String newpwd);
	
	// 查询
	public  List<Map<String, Object>> query(String uname, int page, int num);
	
	public int transform(String a_id, String a_user, String a_email, String a_pwd, String uname);

	// 删除信息
	public int modify(String a_id, String uname);

	// 查询学生的讨论回复
	public List<Map<String, Object>> discu(String d_id);
		
	// 查询老师发布的的讨论
	public List<Map<String, Object>> Studentdiscu(String s_calss);
	
	// 添加老师发布的的讨论
	public int addtaolun(String d_title, String d_titl,String t_name, String s_calss);
	
	public int addpinglun(String d_id, String s_name, String s_titl);

}
