package com.bank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bank.dao.UserDao;
import com.bank.entity.User;
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao dao;
	@Override
	public User userLogin(String username, String password) {
		return dao.findUser(username, password);
	}
	@Override
	public int userRegister(User user) {
		return dao.addUser(user);
	}


}
