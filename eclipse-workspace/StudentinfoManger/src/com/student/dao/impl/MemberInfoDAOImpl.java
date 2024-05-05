package com.student.dao.impl;

import com.student.bean.AdminInfo;
import com.student.bean.StudentInfo;
import com.student.bean.TeacherInfo;
import com.student.dao.DBHelper;
import com.student.dao.IMemberInfoDAO;

public class MemberInfoDAOImpl implements IMemberInfoDAO {

	@Override
	public StudentInfo login(StudentInfo s) {
		DBHelper db = new DBHelper();
		String sql = "select s_id, s_name, s_tel, s_email, s_card, s_sex, s_pwd"
				+ " from student where (s_tel = ? or s_email = ?) and s_pwd = md5(?)";
		return db.findSingle(StudentInfo.class, sql, s.getS_tel(), s.getS_tel(), s.getS_pwd());
	}

	@Override
	public TeacherInfo login(TeacherInfo t) {
		DBHelper db = new DBHelper();
		String sql = "select t_id, t_name, t_tel, t_email, t_card, t_pwd, t_sex, depart, prof"
				+ " from teacher where (t_tel = ? or t_email = ?) and t_pwd = md5(?)";
		return db.findSingle(TeacherInfo.class, sql, t.getT_tel(), t.getT_tel(), t.getT_pwd());
	}

	@Override
	public AdminInfo login(AdminInfo a) {
		DBHelper db = new DBHelper();
		String sql = "select a_id, a_user, a_pwd "
				+ " from admin where a_user = ? and a_pwd = md5(?)";
		return db.findSingle(AdminInfo.class, sql, a.getA_user(), a.getA_pwd());
	}

}
