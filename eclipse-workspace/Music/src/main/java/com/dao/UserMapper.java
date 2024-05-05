package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import com.model.User;

public interface UserMapper {
	User selectUserByUP(@Param("username")String username ,@Param("password") String password);
	@Insert("INSERT INTO `user` VALUES (null,#{username},#{password},'https://p.qpic.cn/music_cover/xjBX9k8QoGbAUicX1ialfQPNzIP2mImXuqoUnCghicEfEodV7Wt12qTOw/600?n=1')")
	int addUser(User user);
	List<User> selectUserAll();
}