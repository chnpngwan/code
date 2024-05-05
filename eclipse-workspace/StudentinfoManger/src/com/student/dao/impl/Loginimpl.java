package com.student.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.student.dao.DBHelper;
import com.student.dao.ILoginDAO;

public class Loginimpl implements ILoginDAO {
	DBHelper db = new DBHelper();
	@Override
	public int Login(String username, String eamil, String tel, String cardid, String sex, String pwd) {
		String sql = "INSERT INTO `student` VALUES (null, ?, ?, ?, ?, ?, md5(?))";
		return db.update(sql, username, eamil, tel, sex, cardid, pwd);
	}
	@Override
	public int addTopic(List<List<Object>> list, String topic, String time) throws SQLException {
		List<String> listsql = new ArrayList<String>();
		List<List<Object>> listparams = new ArrayList<List<Object>>();
		String sql;
		for(List<Object> list1 : list) {
			sql = "INSERT INTO `problems` VALUES (null, ?, ?, ?, ?, ?, ?, '5', '单选题', ?, null)";
			listsql.add(sql);
			list1.add(topic);  
			listparams.add(list1);
		}
		return db.update(listsql, listparams);
	}
	@Override
	public int updatestupwd(String name, String oldpwd, String newpwd) {
		String sql = "update student set s_pwd = md5(?) where s_name = ? and s_pwd = md5(?)";
		return db.update(sql, newpwd, name, oldpwd);
	}
	@Override
	public int updateteapwd(String name, String oldpwd, String newpwd) {
		String sql = "update teacher set t_pwd = md5(?) where t_name = ? and t_pwd = md5(?)";
		return db.update(sql, newpwd, name, oldpwd);
	}

	@Override
	// page 为第一条的索引   page = 第几页 - 1 *num   num为查几条数据
	public List<Map<String, Object>> query(String uname, int page, int num) {
		String sql = "";
		switch (uname) {
		case "admin":
			sql = "select (select count(*) from `admin`) as `count`, a_id, a_user, a_email, a_pwd from `admin` where a_id >= (select a_id from `admin` ORDER BY a_id limit ?, 1) limit ?";
			break;
		case "teacher":
			sql = "select (select count(*) from `teacher`) as `count`, t_id as a_id,t_name as a_user, t_email as a_email, t_pwd as a_pwd from `teacher` where t_id >= (select t_id from `teacher` ORDER BY t_id limit ?, 1) limit ?";
			break;
		case "student":
			sql = "select (select count(*) from `student`) as `count`, s_id as a_id,s_name as a_user, s_email as a_email, s_pwd as a_pwd from `student` where s_id >= (select s_id from `student` ORDER BY s_id limit ?, 1) limit ?";
			break;
		}
		return db.findMultiple(sql, page, num);
	}
	@Override
	public int transform(String a_id, String a_user, String a_email, String a_pwd, String uname) {
		String sql = "";
		switch (uname) {
		case "管理员ID":
			sql = "update `admin` set a_user = ?, a_pwd = md5(?), a_email = ? where a_id = ?";
			break;
		case "老师工号":
			sql = "update `teacher` set t_name = ?, t_pwd = md5(?), t_email = ? where t_id = ?";
			break;
		case "学号":
			sql = "update `student` set s_name = ?, s_pwd = md5(?), s_email = ? where s_id = ?";
			break;
		}
		return db.update(sql, a_user, a_pwd, a_email, a_id);
	}
	@Override
	public int modify(String a_id, String uname) {
		String sql = "";
		switch (uname) {
		case "管理员ID":
			sql = "delete from `admin` where a_id = ? ";
			break;
		case "老师工号":
			sql = "delete from `teacher` where t_id = ?";
			break;
		case "学号":
			sql = "delete from `student` where s_id = ?";
			break;
		}
		return db.update(sql, a_id);
	}
	
	@Override
	public List<Map<String, Object>> discu(String d_id) {
		String sql = "select s_name, date_format(s_time, '%Y-%m-%d %H:%i') as s_time, s_titl from `s_discuss` where d_id = ?";
		return db.findMultiple(sql, d_id);
	}
	@Override
	public List<Map<String, Object>> Studentdiscu(String s_calss) {
		String sql = "select d_id, d_title, d_titl, date_format(d_time, '%Y-%m-%d %H:%i') as d_time, s_name from `discuss` where s_class = ?";
		return db.findMultiple(sql, s_calss);
	}
	@Override
	public int addtaolun(String d_title, String d_titl,String t_name, String s_calss) {
		String sql = "INSERT INTO `discuss` VALUES (null, ?, ?, NOW(), ?, ?)";
		System.out.println(d_title +  d_titl);
		return db.update(sql, d_title, d_titl, t_name, s_calss);
	}
	
	@Override
	public int addpinglun(String d_id, String s_name, String s_titl) {
		String sql = "INSERT INTO `s_discuss` VALUES (null, ?, ?, NOW(), ?)";
		return db.update(sql, d_id, s_name, s_titl);
	}
}
