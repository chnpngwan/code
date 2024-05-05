package com.service;

import java.util.List;

import com.model.User;

public interface UserService {
	//全表查询
	public List<User> selectAllUser();
	//登录
	User usernameAndPassword(User user);
	//注册
	public int insertUser(User user);
}
