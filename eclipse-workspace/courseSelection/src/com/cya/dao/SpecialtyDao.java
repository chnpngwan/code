package com.cya.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cya.dto.Specialty;
import com.cya.dao.ISpecialtyDao;

public class SpecialtyDao extends HibernateDaoSupport implements ISpecialtyDao {

	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Specialty> findByAll() {
		List<Specialty> list = (List<Specialty>) getHibernateTemplate().find("FROM Specialty");
		return list;
	}

	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public Specialty findById(Integer id) {
		Specialty specialty = (Specialty) getHibernateTemplate().get(Specialty.class, id);
		return specialty;
	}

	
	@Transactional(propagation = Propagation.REQUIRED)
	public void insert(Specialty specialty) {
		getHibernateTemplate().save(specialty);
	}


	
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateIsFinish(Integer id) {
		Query q = getSession().createQuery("UPDATE Specialty s SET s.isFinish=? WHERE s.id=?");
		q.setBoolean(0, true);
		q.setInteger(1, id);
		q.executeUpdate();
	}

	
	@Transactional(propagation = Propagation.REQUIRED,readOnly=true)
	public List<Specialty> findStuByAll() {
		Query q = getSession().createQuery("FROM Specialty WHERE isFinish=false");
		List<Specialty> list = q.list();
		return list;
	}
}
