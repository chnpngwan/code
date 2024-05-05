package com.bank.dao;

import org.apache.ibatis.annotations.Param;

import com.bank.entity.User;

public interface UserDao {
	//用户登录
	public User findUser(@Param("userName") String username,@Param("password") String password) ;
	//用户注册
	public int addUser(User user);
}	
