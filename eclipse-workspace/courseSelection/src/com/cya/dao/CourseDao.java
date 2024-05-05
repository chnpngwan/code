package com.cya.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cya.dto.Course;
import com.cya.dao.ICourseDao;

public class CourseDao extends HibernateDaoSupport implements ICourseDao {

	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Course> findByAll() {
		List<Course> list  = (List<Course>) getHibernateTemplate().find("from Course");
		return list;
	}

	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public Course findByID(Integer id) {
		Course course = (Course) getHibernateTemplate().get(Course.class, id);
		return course;
	}

	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Object> findBySearch(Map<String,String> map) {
		
		String sql = "FROM Specialty s, Course c Where s.id=c.specialtyId ";
		if(map.get("specialtyId")!=null){
			sql += " AND c.specialtyId = "+map.get("specialtyId");
		}
		if(map.get("name")!=null){
			sql += " AND c.name like '%"+map.get("name")+"%'";
		}
		if(map.get("teacherName")!=null){
			sql += " AND c.teacherName like '%"+map.get("teacherName")+"%'";
		}
		List<Object> list = (List<Object>) getHibernateTemplate().find(sql);
		return list;
	}

	
	@Transactional(propagation = Propagation.REQUIRED)
	public void insert(Course course) {
		getHibernateTemplate().save(course);
	}

	
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateIsFinish(Integer id) {
		Query q = getSession().createQuery("UPDATE Course c SET c.isFinish=? WHERE c.id=?");
		q.setBoolean(0, false);//���˿γ���Ϊ����ѡ
		q.setInteger(1, id);
		q.executeUpdate();
	}

	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Object[]> findByStat(Map<String, String> map) {
		String sql = "SELECT c.id,c.name,c.teacherName,c.schooltime,c.addr," +
				"s.enterYear,s.langthYear,s.name,s.id " +
				"FROM Course c,Specialty s " +
				"WHERE s.id=c.specialtyId ";
		if(map.get("specialtyId")!=null){
			sql += " AND c.specialtyId = "+map.get("specialtyId");
		}
		if(map.get("name")!=null){
			sql += " AND c.name like '%"+map.get("name")+"%'";
		}
		if(map.get("teacherName")!=null){
			sql += " AND c.teacherName like '%"+map.get("teacherName")+"%'";
		}
		List<Object[]> list = (List<Object[]>) getHibernateTemplate().find(sql);
		System.out.println(list.size());
		return list;
	}

	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Object[]> findSelectStu(Integer id) {
		String sql = "FROM StuUser s,StuCourse sc WHERE sc.courseId=? AND s.id=sc.stuId";
		Query q = getSession().createQuery(sql);
		q.setInteger(0, id);
		List<Object[]> list = q.list();
		return list;
	}
}
