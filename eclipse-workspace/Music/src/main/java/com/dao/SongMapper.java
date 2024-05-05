package com.dao;

import com.model.Song;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SongMapper {
	List<Song> selectSongAll();
	Song selectSongById(int id);
}