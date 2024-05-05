package com.student.biz.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import com.student.bean.ClassInfo;
import com.student.bean.ExamInfo;
import com.student.bean.WordInfo;
import com.student.dao.IClassInfoDAO;
import com.student.dao.impl.ClassInfoDAOImpl;
import com.student.utils.StringUtil;

public class ClassInfoBizImpl implements IClassInfoBiz{

	@Override
	public Map<String, Object> findstu(String id, String name, int page, int rows) {
		IClassInfoDAO dao = new ClassInfoDAOImpl();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", dao.totalstu(id, name));
		map.put("rows", dao.findstu(id, name, page, rows));
		return map;
	}
	
	@Override
	public Map<String, Object> findtea(String id, String name, int page, int rows) {
		IClassInfoDAO dao = new ClassInfoDAOImpl();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", dao.totaltea(id, name));
		map.put("rows", dao.findtea(id, name, page, rows));
		return map;
	}

	@Override
	public List<Map<String, Object>> findBystu(String id, String name, int page, int rows) {
		IClassInfoDAO dao = new ClassInfoDAOImpl();
		return dao.findstu(id, name, page, rows);
	}
	
	@Override
	public List<Map<String, Object>> findBytea(String id, String name, int page, int rows) {
		IClassInfoDAO dao = new ClassInfoDAOImpl();
		return dao.findtea(id, name, page, rows);
	}

	@Override
	public ClassInfo joinClass(String id) {
		if(id.isEmpty() || id == null) {
			return null;
		}
		IClassInfoDAO dao = new ClassInfoDAOImpl();
		System.out.println(dao.joinClass(id));
		return dao.joinClass(id);
	}

	@Override
	public List<ExamInfo> findExam(String id, String s_id) {
		if(id.isEmpty() || id == null) {
			return null;
		}
		IClassInfoDAO dao = new ClassInfoDAOImpl();
		return dao.findExam(id, s_id);
	}
	
	@Override
	public List<WordInfo> findWord(String id, String s_id) {
		if(id.isEmpty() || id == null) {
			return null;
		}
		IClassInfoDAO dao = new ClassInfoDAOImpl();
		return dao.findWord(id, s_id);
	}


	@Override
	public int addclass(String name, String t_id, String starttime, String endtime, String image) {
		if(StringUtil.checkNull(name, t_id, starttime, endtime, image)) {
			return 0;
		}
		IClassInfoDAO dao = new ClassInfoDAOImpl();
		return dao.addclass(name, t_id, starttime, endtime, image);
	}

	@Override
	public Map<String, Object> findpro(String e_name) {
		IClassInfoDAO dao = new ClassInfoDAOImpl();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", dao.totalpro(e_name));
		map.put("data", dao.findpro(e_name));
		return map;
	}

	@Override
	public List<Map<String, Object>> getdegree(String id) {
		IClassInfoDAO dao = new ClassInfoDAOImpl();
		List<Map<String, Object>> list1 = dao.getexamdegree(id);
		List<Map<String, Object>> list2 = dao.getworddegree(id);
		List<Map<String, Object>> list = list1.stream().map(m -> {
			list2.stream().filter(m2-> Objects.equals(m.get("s_id"),m2.get("s_id"))).forEach(m2-> {
				m.put("wdegree",m2.get("wdegree"));
			});
			return m;
		}).collect(Collectors.toList());
		return list;
	}

	@Override
	public List<Map<String,Object>> findExam1(String id) {
		if(id.isEmpty() || id == null) {
			return null;
		}
		IClassInfoDAO dao = new ClassInfoDAOImpl();
		return dao.findExam1(id);
	}

	@Override
	public List<Map<String,Object>> findWord1(String id) {
		if(id.isEmpty() || id == null) {
			return null;
		}
		IClassInfoDAO dao = new ClassInfoDAOImpl();
		return dao.findWord1(id);
	}

	@Override
	public Map<String, Object> findpro1(String w_name) {
		IClassInfoDAO dao = new ClassInfoDAOImpl();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", dao.totalpro1(w_name));
		map.put("data", dao.findpro1(w_name));
		return map;
	}

	@Override
	public Map<String, Object> findAll(String id, String name, int page, int rows) {
		IClassInfoDAO dao = new ClassInfoDAOImpl();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", dao.totalAll(id, name));
		map.put("rows", dao.findAll(id, name, page, rows));
		return map;
	}
}
