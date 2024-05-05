package com.student.biz.impl;

import java.util.List;
import java.util.Map;

public interface IStudnetInfoBiz {
	public List<Map<String, Object>> getGrade(String s_id, String s_name, String t_name);
}
