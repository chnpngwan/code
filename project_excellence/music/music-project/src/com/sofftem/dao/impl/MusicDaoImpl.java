package com.sofftem.dao.impl;

import com.sofftem.bean.Music;
import com.sofftem.dao.MusicDao;
import com.sofftem.utils.BaseDao;

import java.util.List;

public class MusicDaoImpl extends BaseDao<Music> implements MusicDao {
    @Override
    public Music queryMusicById(Integer id) {
        return this.getBean("SELECT * FROM music where id = ?", id);
    }

    @Override
    public Integer queryCountByAlbumId(Integer album_id) {
        return this.getValue("SELECT COUNT(*) from music WHERE album_id = ? ", album_id).intValue();
    }

    @Override
    public List<Music> queryMusicByAuthorId(Integer author_id) {
        return this.getBeanList("select * from music where album_id = ? ", author_id);
    }

    @Override
    public List<Music> queryMusicByAlbumId(Integer album_id) {
        return this.getBeanList("select * from music where album_id = ? ", album_id);
    }

    @Override
    public List<Music> queryMusicByGanerId(Integer ganer_id) {
        return this.getBeanList("select * from music where album_id = ? ", ganer_id);
    }

    @Override
    public List<Music> queryMusicOrderHot() {
        return this.getBeanList("select * from music order by hot desc LIMIT 5");
    }

    @Override
    public List<Music> queryMusicOrderBarthtime() {
        return this.getBeanList("select * from music order by barthtime desc LIMIT 5");
    }
}
