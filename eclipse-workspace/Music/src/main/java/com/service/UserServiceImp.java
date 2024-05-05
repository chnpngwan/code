package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.UserMapper;
import com.model.User;
@Service
public class UserServiceImp implements UserService{

	@Resource
	private UserMapper userMapper;
	

	@Override
	public User selectUserByUP(String username, String password) {
		// TODO Auto-generated method stub
		return userMapper.selectUserByUP(username, password);
	}


	@Override
	public int addUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.addUser(user);
	}


	@Override
	public List<User> selectUserAll() {
		// TODO Auto-generated method stub
		return userMapper.selectUserAll();
	}

}
