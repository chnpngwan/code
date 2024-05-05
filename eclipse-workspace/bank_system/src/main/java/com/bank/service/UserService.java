package com.bank.service;

import com.bank.entity.User;

public interface UserService {
	//用户登录
	public User userLogin(String username,String password) ;
	
	//用户登录
	public int userRegister(User user);

}
