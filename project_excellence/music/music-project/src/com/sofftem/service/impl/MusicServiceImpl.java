package com.sofftem.service.impl;

import com.sofftem.bean.Music;
import com.sofftem.dao.MusicDao;
import com.sofftem.dao.impl.MusicDaoImpl;
import com.sofftem.service.MusicService;

import java.util.List;

public class MusicServiceImpl implements MusicService {
    MusicDao musicDao = new MusicDaoImpl();
    private int i = 1;

    @Override
    public List<Music> queryMusicByAlbumId(Integer album_id) {
        List<Music> musics = musicDao.queryMusicByAlbumId(album_id);
        for (Music music : musics) {
            music.setNumber(i);
            music.setAuthorname(new ArtistServiceImpl().queryArtistById(music.getAuthor_id()).getArt_name());
            i++;
        }
        return musics;
    }

    @Override
    public Music queryMusicByid(Integer id) {
        Music music = musicDao.queryMusicById(id);
        music.setAuthorname(new ArtistServiceImpl().queryArtistById(music.getAuthor_id()).getArt_name());
        return music;
    }

    @Override
    public List<Music> HotMusic() {
        List<Music> musicList = musicDao.queryMusicOrderHot();
        for (Music music : musicList) {
            music.setNumber(i);
            String artName = new ArtistServiceImpl().queryArtistById(music.getAuthor_id()).getArt_name();
            music.setAuthorname(artName);
            i++;
        }
        return musicList;
    }

    @Override
    public List<Music> NewMusic() {
        List<Music> musicList = musicDao.queryMusicOrderBarthtime();
        for (Music music : musicList) {
            music.setNumber(i);
            String artName = new ArtistServiceImpl().queryArtistById(music.getAuthor_id()).getArt_name();
            music.setAuthorname(artName);
            i++;
        }
        return musicList;
    }
}
