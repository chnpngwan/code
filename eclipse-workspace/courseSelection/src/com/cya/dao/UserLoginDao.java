package com.cya.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cya.dto.UserLogin;
import com.cya.dao.IUserLoginDao;

public class UserLoginDao extends HibernateDaoSupport implements IUserLoginDao {

	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public UserLogin findbyNameAndPwd(String name,String pwd) {
		Query q = getSession().createQuery("FROM UserLogin WHERE loginName=? and pwd = ?");
		q.setString(0, name);
		q.setString(1, pwd);
		List list = q.list();
		if(list.isEmpty()){
			System.out.println("登录失败");
			return null;
		}else{
			System.out.println("登录成功");
			UserLogin userLogin = (UserLogin) list.get(0);
			return userLogin;
		}
	}

	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public boolean findByLoginName(String loginName) {
		Query q = getSession().createQuery("FROM UserLogin WHERE loginName=?");
		q.setString(0, loginName);
		List list = q.list();
		if(list.isEmpty()){
			return false;
		}else{
			return true;
		}
	}

	
	@Transactional(propagation = Propagation.REQUIRED)
	public Integer insert(UserLogin user) {
		getHibernateTemplate().save(user);
		return user.getId();
	}

	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public Integer findByNPM(String name, String pwd, String mail) {
		Query q = getSession().createQuery("FROM UserLogin WHERE loginName=? AND pwd=? and mail=?");
		q.setString(0, name);
		q.setString(1, pwd);
		q.setString(2, mail);
		List list = q.list();
		if(!list.isEmpty()){
			UserLogin user = (UserLogin) list.get(0);
			return user.getId();
		}else{
			return -1;
		}
	}

	
	@Transactional(propagation = Propagation.REQUIRED)
	public void updatePwd(Integer id,String pwd) {
		Query q = getSession().createQuery("UPDATE UserLogin user Set user.pwd = ? WHERE id = ?");
		q.setString(0, pwd);
		q.setInteger(1, id);
		q.executeUpdate();
	}
}
