package com.service;

import java.util.List;

import com.model.User;

public interface UserService {
	User selectUserByUP(String username,String password);
	int addUser(User user);
	List<User> selectUserAll();
}
