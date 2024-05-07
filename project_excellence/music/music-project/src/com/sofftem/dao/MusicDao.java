package com.sofftem.dao;

import com.sofftem.bean.Music;

import java.util.List;

public interface MusicDao {
    Music queryMusicById(Integer id);
    List<Music> queryMusicByAlbumId(Integer album_id);
    Integer queryCountByAlbumId(Integer album_id);
    List<Music> queryMusicByAuthorId(Integer author_id);
    List<Music> queryMusicByGanerId(Integer garner_id);
    List<Music> queryMusicOrderHot();
    List<Music> queryMusicOrderBarthtime();

}
