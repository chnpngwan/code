package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.UserDao;
import com.model.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Resource
	public UserDao userDao;

	//全表查询
	@Override
	public List<User> selectAllUser() {
		return userDao.selectAllUser();
	}

	//登录验证
	@Override
	public User usernameAndPassword(User user) {
		return userDao.usernameAndPassword(user);
	}

	//注册
	@Override
	public int insertUser(User user) {
		return userDao.insertUser(user);
	}

}
