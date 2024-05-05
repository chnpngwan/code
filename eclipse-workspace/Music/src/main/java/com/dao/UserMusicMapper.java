package com.dao;

import com.model.UserMusic;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

public interface UserMusicMapper {
	List<UserMusic> selectUmByUId(int id);
	@Delete("delete from user_music where user_id=#{userId} and music_id=#{musicId}")
	int delUMByUm(UserMusic userMusic);
	@Insert("INSERT INTO user_music  VALUES (#{userId},#{musicId})")
	int addUM(UserMusic userMusic);
}