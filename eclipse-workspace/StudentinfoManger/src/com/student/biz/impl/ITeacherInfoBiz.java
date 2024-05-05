package com.student.biz.impl;

import java.util.List;
import java.util.Map;

public interface ITeacherInfoBiz {
	public List<Map<String, Object>> getGradeList(String t_id, String s_name, String s_id, String name, String c_name,String order);

	public Map<String, Object> baobiao(String valueOf);
}
