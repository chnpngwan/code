package com.bank.dao;

import org.apache.ibatis.annotations.Param;

import com.bank.entity.User;

public interface UserDao {
	//�û���¼
	public User findUser(@Param("userName") String username,@Param("password") String password) ;
	//�û�ע��
	public int addUser(User user);
}	
