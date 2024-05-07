package com.car.service;

import com.car.model.User;

import java.util.List;

public interface UserService {
	//全表查询
	public List<User> selectAllUser();
	//登录
	User usernameAndPassword(User user);
	//注册
	public int insertUser(User user);
}
