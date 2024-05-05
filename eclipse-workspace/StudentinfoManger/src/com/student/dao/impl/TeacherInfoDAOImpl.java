package com.student.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.student.dao.DBHelper;
import com.student.dao.ITeacherInfoDAO;
import com.student.utils.StringUtil;

public class TeacherInfoDAOImpl implements ITeacherInfoDAO{
	DBHelper db = new DBHelper();
	@Override
	public List<Map<String, Object>> getGradeList(String t_id, String s_name, String s_id, String name, String c_name,String order) {
		List<Object> params = new ArrayList<Object>();
		String sql = "select s.s_id, s_name, t_name, c_name, degree from "
				+ " grade g, course co, class cl, teacher t, student s where "
				+ " g.id = cl.id and cl.c_id = co.c_id and co.t_id = t.t_id and g.s_id = s.s_id ";
		if(s_id != null) {
			sql += " and s.s_id = ? ";
			params.add(s_id);
		}
		if(s_name != null) {
			sql += " and s_name like concat('%', ?, '%') ";
			params.add(s_name);
		}
		if(t_id != null) {
			sql += " and co.t_id = ? ";
			params.add(t_id);
		}
		if(c_name != null) {
			sql += " and c_name like concat('%', ?, '%') ";
			params.add(c_name);
		}
		if(name != null) {
			sql += " and name like concat('%', ?, '%') ";
			params.add(name);
		}if( !StringUtil.checkNull( order)) {
			sql += " order by s_id " + order;
		}else {
			sql += " order by s_id asc";
		}
		if( null == params || params.isEmpty()){
			return db.findMultiple(sql);
		}
		return db.findMultiple(sql, params.toArray());
	}
	
	public int updateGrade(String t_id, String degree) {
		
		String sql = "update set degree = ? from "
				+ " grade g, course co, class cl, teacher t, student s where "
				+ " g.id = cl.id and cl.c_id = co.c_id and co.t_id = t.t_id and g.s_id = s.s_id and co.t_id = ?";
		return db.update(sql, degree, t_id);
	}

	@Override
	public int delete(String s_id, String id) {
		String sql = "delete from grade where s_id = ? and id = ?";
		return db.update(sql, s_id, id);
	}

	@Override
	public Map<String, Object> findexam(String id) {
		String sql = "select sum(case when z.edegree between 0 and 59 then 1 else 0 end) as \"E\",\r\n" + 
				"sum(case when z.edegree between 60 and 69 then 1 else 0 end) as \"D\", \r\n" + 
				"sum(case when z.edegree between 70 and 79 then 1 else 0 end) as \"C\",\r\n" + 
				"sum(case when z.edegree between 80 and 89 then 1 else 0 end) as \"B\",\r\n" + 
				"sum(case when z.edegree between 90 and 100 then 1 else 0 end) as \"A\"\r\n" + 
				"from (SELECT avg(ifnull(e.degree, 0)) edegree from (select s.s_id s_id, s_name,degree from student "
				+ "s LEFT JOIN grade g on  s.s_id = g.s_id where id = ?) x LEFT JOIN examgrade e on x.s_id = e.s_id "
				+ "and e_name != 'null' and id = ? GROUP BY x.s_id) z";
		return db.findSingle(sql, id, id);
	}
	
	@Override
	public Map<String, Object> findword(String id) {
		String sql = "select sum(case when z.wdegree between 0 and 59 then 1 else 0 end) as \"E\",\r\n" + 
				"sum(case when z.wdegree between 60 and 69 then 1 else 0 end) as \"D\", \r\n" + 
				"sum(case when z.wdegree between 70 and 79 then 1 else 0 end) as \"C\",\r\n" + 
				"sum(case when z.wdegree between 80 and 89 then 1 else 0 end) as \"B\",\r\n" + 
				"sum(case when z.wdegree between 90 and 100 then 1 else 0 end) as \"A\"\r\n" + 
				"from (SELECT x.s_id s_id, x.s_name s_name, avg(ifnull(e.degree, 0)) wdegree from (select s.s_id "
				+ "s_id, s_name from student s LEFT JOIN grade g on s.s_id = g.s_id where id = ?) x LEFT JOIN "
				+ "examgrade e on x.s_id = e.s_id and w_name != 'null' and id = ? GROUP BY x.s_id) z";
		return db.findSingle(sql, id, id);
	}

	@Override
	public int add(String s_id, String id) {
		String sql = "insert into grade values(?, ?, null)";
		return db.update(sql, id, s_id);
	}

	@Override
	public int addgrade(String id, String s_id, String degree) {
		String sql = "update grade set degree = ? where s_id = ? and id = ?";
		return db.update(sql, degree, s_id, id);
	}
}
