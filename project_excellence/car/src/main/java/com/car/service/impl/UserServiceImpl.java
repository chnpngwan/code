package com.car.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.car.mapper.UserMapper;
import com.car.model.User;
import com.car.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	
	@Resource
	public UserMapper userMapper;

	//全表查询
	@Override
	public List<User> selectAllUser() {
		return userMapper.selectAllUser();
	}

	//登录验证
	@Override
	public User usernameAndPassword(User user) {
		return userMapper.usernameAndPassword(user);
	}

	//注册
	@Override
	public int insertUser(User user) {
		return userMapper.insertUser(user);
	}

}
