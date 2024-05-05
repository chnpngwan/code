package com.dao;

import com.model.Music;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MusicMapper {
	List<Music> selectMusicBysongID(int id);
	
	Music selectMusicById(int id);
	
	List<Music> selectMusicListByuId(int id);
	
	List<Music> selectlike(@Param("text") String text);
}