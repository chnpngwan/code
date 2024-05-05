package com.student.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.student.bean.ClassInfo;
import com.student.dao.DBHelper;
import com.student.dao.IStudentInfoDAO;

public class StudentInfoDAOImpl implements IStudentInfoDAO{

	public List<Map<String, Object>> getGrade(String s_id, String s_name, String t_name) {
		DBHelper db = new DBHelper();
		List<Object> params = new ArrayList<Object>();
		String sql = "select s.s_id, s_name, name, t_name, degree from "
				+ " grade g, class cl, teacher t, student s where "
				+ " g.id = cl.id and cl.t_id = t.t_id and g.s_id = s.s_id and degree is not null";;
		if(s_id != null) {
			sql += " and s.s_id = ? ";
			params.add(s_id);
		}
		if(s_name != null) {
			sql += " and s_name = ? ";
			params.add(s_name);
		}
		if(t_name != null) {
			sql += " and t_name = ? ";
			params.add(t_name);
		}
		if( null == params || params.isEmpty()){
			return db.findMultiple(sql);
		}
		return db.findMultiple(sql, params.toArray());
	}

	
}
