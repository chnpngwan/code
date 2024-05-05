package com.student.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.student.bean.ClassInfo;
import com.student.bean.ExamInfo;
import com.student.bean.WordInfo;
import com.student.bean.problemsInfo;
import com.student.dao.DBHelper;
import com.student.dao.IClassInfoDAO;
import com.student.utils.StringUtil;

public class ClassInfoDAOImpl implements IClassInfoDAO {
	DBHelper db = new DBHelper();
	@Override
	public List<Map<String, Object>> findtea(String id, String name, int page, int rows) {
		String sql = "select id, name, t_name, image, date_format(starttime, '%Y-%m-%d') starttime, date_format(endtime, '%Y-%m-%d') endtime from teacher t, class cl "
				+ " where  cl.t_id = t.t_id ";
		List<Object> params = new ArrayList<Object>();
		if( !StringUtil.checkNull( id)) {
			sql += " and cl.t_id = ? ";
			params.add( id );
		}
		if( !StringUtil.checkNull( name)) {
			sql += " and name like concat('%', ?, '%')";
			params.add( name );
		}else {
			sql += " order by id asc ";
		}
		sql += " limit ?, ?";
		params.add( (page - 1) * rows );
		params.add( rows );
		if( null == params || params.isEmpty()){
			return db.findMultiple(ClassInfo.class, sql);
		}
		return db.findMultiple(sql, params.toArray());
	}
	
	@Override
	public List<Map<String, Object>> findstu(String id, String name, int page, int rows) {
		String sql = "select cl.id, name, t_name, image, date_format(starttime, '%Y-%m-%d') starttime, date_format(endtime, '%Y-%m-%d') endtime from teacher t, class cl,  grade g"
				+ " where  cl.t_id = t.t_id and g.id = cl.id";
		List<Object> params = new ArrayList<Object>();
		if( !StringUtil.checkNull( id)) {
			sql += " and s_id = ?";
			params.add( id );
		}
		if( !StringUtil.checkNull( name)) {
			sql += " and name like concat('%', ?, '%')";
			params.add( name );
		}
		sql += " order by cl.id asc ";
		sql += " limit ?, ?";
		System.out.println(rows);
		params.add( (page - 1) * rows );
		params.add( rows );
		if( null == params || params.isEmpty()){
			return db.findMultiple(ClassInfo.class, sql);
		}
		return db.findMultiple(sql, params.toArray());
	}

	@Override
	public int totaltea(String id, String name) {
		String sql = "select count(id) from teacher t, class cl "
				+ " where cl.t_id = t.t_id ";
		List<Object> params = new ArrayList<Object>();
		if( !StringUtil.checkNull( id)) {
			sql += " and cl.t_id = ? ";
			params.add( id );
		}
		if( !StringUtil.checkNull( name)) {
			sql += " and name like concat('%', ?, '%')";
			params.add( name );
		}
		if( null == params || params.isEmpty()){
			return db.getTotal(sql);
		}
		return db.getTotal(sql, params.toArray());
	}
	
	@Override
	public int totalstu(String id, String name) {
		String sql = "select count(cl.id) from teacher t, class cl, grade g "
				+ " where cl.t_id = t.t_id and g.id = cl.id ";
		List<Object> params = new ArrayList<Object>();
		if( !StringUtil.checkNull(id)) {
			sql += " and s_id = ?";
			params.add( id );
		}
		if( !StringUtil.checkNull( name)) {
			sql += " and name like concat('%', ?, '%')";
			params.add( name );
		}
		if( null == params || params.isEmpty()){
			return db.getTotal(sql);
		}
		return db.getTotal(sql, params.toArray());
	}

	@Override
	public ClassInfo joinClass(String id) {
		String sql = "select id, name, image, date_format(starttime, '%Y-%m-%d') starttime, date_format(endtime, '%Y-%m-%d') endtime from class where id = ?"; 
		return db.findSingle(ClassInfo.class, sql, id);
	}

	@Override
	public List<ExamInfo> findExam(String id, String s_id) {
		String sql = "select e.e_name e_name, date_format(starttime, '%Y-%m-%d %H:%i') starttime, date_format(endtime, '%Y-%m-%d %H:%i') endtime, time, e.degree degree, g.degree degree1 from exam e LEFT JOIN examgrade g on e.e_name = g.e_name and s_id = ? and g.id = ? where e.id = ?"; 
		return db.findMultiple(ExamInfo.class, sql, s_id, id, id);
	}
	
	@Override
	public List<WordInfo> findWord(String id, String s_id) {
		String sql = "select e.w_name w_name, date_format(starttime, '%Y-%m-%d %H:%i') starttime, date_format(endtime, '%Y-%m-%d %H:%i') endtime, e.degree degree, g.degree degree1 from word e LEFT JOIN examgrade g on e.w_name = g.w_name and s_id = ? and g.id = ? where e.id = ?"; 
		return db.findMultiple(WordInfo.class, sql, s_id, id, id);
	}

	@Override
	public int addclass(String name, String t_id, String starttime, String endtime, String image) {
		String sql = "insert into class values(null, ?, ?, ?, ?, ?)";
		return db.update(sql, name, image, starttime, endtime, t_id);
	}
	
	@Override
	public int addTopic(List<List<Object>> list, String topic, String w_name) throws SQLException{
		List<String> listsql = new ArrayList<String>();
		List<List<Object>> listparams = new ArrayList<List<Object>>();
		String sql = null;
		if(w_name == "" || w_name.isEmpty()) {
			for(List<Object> list1 : list) {
				sql = "INSERT INTO `problems` VALUES (null, ?, ?, ?, ?, ?, ?, '5', '单选题', ?, null)";
				listsql.add(sql);
				list1.add(topic);  
				listparams.add(list1);
			}
		}else if(topic == "" || topic.isEmpty()){
			for(List<Object> list1 : list) {
				sql = "INSERT INTO `problems` VALUES (null, ?, ?, ?, ?, ?, ?, '5', '单选题', null, ?)";
				listsql.add(sql);
				list1.add(w_name);  
				listparams.add(list1);
			}
		}
		System.out.println(sql);
		return db.update(listsql, listparams);
	}


	@Override
	public int addExam(String e_name, String id, String starttime, String endtime, String time, String degree) {
		String sql = "insert into exam values(?, ?, ?, ?, ?, ?)";
		return db.update(sql, e_name, id, starttime, endtime, time, degree);
	}

	@Override
	public int addWord(String w_name, String id, String starttime, String endtime, String degree) {
		String sql = "insert into word values(?, ?, ?, ?, ?)";
		return db.update(sql, id, w_name, starttime, endtime, degree);
	}

	@Override
	public List<problemsInfo> findpro(String e_name) {
		String sql = "select p_id, title, options1, options2, options3, options4, answer, degree, type, e_name, w_name from problems where e_name = ?";
		return db.findMultiple(problemsInfo.class, sql, e_name);
	}

	@Override
	public int totalpro(String e_name) {
		String sql = "select count(p_id) from problems where e_name = ?";
		return db.getTotal(sql, e_name);
	}

	@Override
	public int getexamdegree(String s_id, String e_name, String degree, String id) {
		String sql = "insert into examgrade values(?, ?, 'null', ?, ?)";
		return db.update(sql, s_id, e_name, degree, id);
	}
	
	@Override
	public int getworddegree(String s_id, String e_name, String degree, String id) {
		String sql = "insert into examgrade values(?,'null', ?, ?, ?)";
		return db.update(sql, s_id, e_name, degree, id);
	}
	
	@Override
	public List<Map<String, Object>> getexamdegree(String id) {
		String sql = "SELECT x.s_id s_id, x.s_name s_name, avg(ifnull(e.degree, 0)) edegree, ifnull(x.degree , 0) totaldegree from (select s.s_id s_id, s_name,degree from student s LEFT JOIN grade g on "
				+ " s.s_id = g.s_id where id = ?) x LEFT JOIN examgrade e on x.s_id = e.s_id and e_name != 'null' and id = ? GROUP BY x.s_id";
		return db.findMultiple(sql, id, id);
	}

	@Override
	public List<Map<String, Object>> getworddegree(String id) {
		String sql = "SELECT x.s_id s_id, x.s_name s_name, avg(ifnull(e.degree, 0)) wdegree from (select s.s_id s_id, s_name from student s LEFT JOIN grade g on "
				+ " s.s_id = g.s_id where id = ?) x LEFT JOIN examgrade e on x.s_id = e.s_id and w_name != 'null' and id = ? GROUP BY x.s_id";
		return db.findMultiple(sql, id, id);
	}


	@Override
	public List<Map<String,Object>> findExam1(String id) {
		String sql = "select e.e_name e_name, date_format(starttime, '%Y-%m-%d %H:%i') starttime, date_format(endtime, '%Y-%m-%d %H:%i') endtime, time, e.degree degree, sum(case when "
				+ "g.degree is not null then 1 else 0 end) degree1 from exam e LEFT JOIN examgrade g on e.e_name = g.e_name  and g.id = ? where e.id = ? GROUP BY e.e_name, starttime, endtime, time, degree";
		return db.findMultiple(sql, id, id);
	}
	
	public List<Map<String,Object>> findWord1(String id) {
		String sql = "select e.w_name w_name, date_format(starttime, '%Y-%m-%d %H:%i') starttime, date_format(endtime, '%Y-%m-%d %H:%i') endtime, e.degree degree, sum(case when "
				+ "g.degree is not null then 1 else 0 end) degree1 from word e LEFT JOIN examgrade g on e.w_name = g.w_name  and g.id = ? where e.id = ? GROUP BY e.w_name, starttime, endtime, degree";
		return db.findMultiple(sql, id, id);
	}

	@Override
	public Object totalpro1(String w_name) {
		String sql = "select count(p_id) from problems where w_name = ?";
		return db.getTotal(sql, w_name);
	}

	@Override
	public Object findpro1(String w_name) {
		String sql = "select p_id, title, options1, options2, options3, options4, answer, degree, type, e_name, w_name from problems where w_name = ?";
		return db.findMultiple(problemsInfo.class, sql, w_name);
	}

	@Override
	public int totalAll(String id, String name) {
		String sql = "select count(x.id) from (select c.id, t_id, name from class c LEFT JOIN  grade g on c.id ="
				+ " g.id and s_id = ? where s_id is null) x, teacher t where x.t_id = t.t_id ";
		List<Object> params = new ArrayList<Object>();
		params.add( id );
		if( !StringUtil.checkNull( name)) {
			sql += " and x.name like concat('%', ?, '%')";
			params.add( name );
		}
		if( null == params || params.isEmpty()){
			return db.getTotal(sql);
		}
		return db.getTotal(sql, params.toArray());
	}

	@Override
	public List<Map<String,Object>> findAll(String id, String name, int page, int rows) {
		String sql = "select x.id id, x.name name, t_name, x.image image, date_format(x.starttime, '%Y-%m-%d') starttime,"
				+ " date_format(x.endtime, '%Y-%m-%d') endtime from (select c.id, t_id, name, image, starttime, endtime"
				+ " from class c LEFT JOIN  grade g on c.id = g.id and s_id = ? where s_id is null) x, teacher t where x.t_id = t.t_id";
		List<Object> params = new ArrayList<Object>();
		params.add( id );
		if( !StringUtil.checkNull( name)) {
			sql += " and name like concat('%', ?, '%')";
			params.add( name );
		}
		sql += " order by id asc ";
		sql += " limit ?, ?";
		System.out.println(rows);
		params.add( (page - 1) * rows );
		params.add( rows );
		if( null == params || params.isEmpty()){
			return db.findMultiple(ClassInfo.class, sql);
		}
		return db.findMultiple(sql, params.toArray());
	}
	
	@Override
	public List<Map<String,Object>> baobiao(String s_id, String id) {
		String sql = "select e.e_name e_name, e.degree degree, IfNULL(g.degree, '0') degree1 from exam e LEFT JOIN examgrade g on "
				+ "e.e_name = g.e_name and s_id = ? and g.id = ? where e.id = ?";
		return db.findMultiple(sql, s_id, id, id);
	}

	@Override
	public List<Map<String, Object>> baobiao1(String s_id, String id) {
		String sql = "select e.w_name w_name, e.degree degree, IfNULL(g.degree, '0') degree1 from word e LEFT JOIN examgrade g on "
				+ "e.w_name = g.w_name and s_id = ? and g.id = ? where e.id = ?";
		return db.findMultiple(sql, s_id, id, id);
	}
}
