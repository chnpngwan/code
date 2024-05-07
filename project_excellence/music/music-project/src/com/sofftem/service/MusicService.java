package com.sofftem.service;

import com.sofftem.bean.Music;

import java.util.List;

public interface MusicService {
    Music queryMusicByid(Integer id);
    List<Music> queryMusicByAlbumId(Integer album_id);
    List<Music> HotMusic();
    List<Music> NewMusic();
}
