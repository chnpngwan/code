package com.student.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.student.dao.ITeacherInfoDAO;
import com.student.dao.impl.TeacherInfoDAOImpl;

public class TeacherInfoBizImpl implements ITeacherInfoBiz{

	@Override
	public List<Map<String, Object>> getGradeList(String t_id, String s_name, String s_id, String name, String c_name,
			String order) {
		ITeacherInfoDAO dao = new TeacherInfoDAOImpl();
		return dao.getGradeList(t_id, s_name, s_id, name, c_name, order);
	}

	@Override
	public Map<String, Object> baobiao(String id) {
		ITeacherInfoDAO dao = new TeacherInfoDAOImpl();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("exam", dao.findexam(id));
		map.put("word", dao.findword(id));
		return map;
	}
	
}
