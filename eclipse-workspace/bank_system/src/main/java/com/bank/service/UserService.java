package com.bank.service;

import com.bank.entity.User;

public interface UserService {
	//�û���¼
	public User userLogin(String username,String password) ;
	
	//�û���¼
	public int userRegister(User user);

}
