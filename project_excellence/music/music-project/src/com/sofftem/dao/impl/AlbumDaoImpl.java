package com.sofftem.dao.impl;

import com.sofftem.bean.Album;
import com.sofftem.dao.AlbumDao;
import com.sofftem.utils.BaseDao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class AlbumDaoImpl extends BaseDao<Album> implements AlbumDao {
    @Override
    public List<Album> queryAlbumByArtId(Integer art_id) {
        return this.getBeanList("select * from album where art_id = ? ", art_id);
    }

    @Override
    public Album queryAlbumById(Integer id) {
        return this.getBean("select * from album where id = ? ", id);
    }

    @Override
    public Integer queryForPageTotalCount(String albumOrartname, Integer genre_id) {
        StringBuilder sql = new StringBuilder("select count(*) from album where 1=1 ");
        ArrayList<Serializable> params = new ArrayList<>();//保存参数的
        if (albumOrartname != null && !"".equals(albumOrartname)) {
            sql.append("and (art_id IN (SELECT id FROM artist WHERE art_name LIKE CONCAT('%',?,'%')) OR album_name LIKE CONCAT('%',?,'%'))");
            params.add(albumOrartname);
            params.add(albumOrartname);
        }
        if (genre_id != 0) {
            sql.append("and genre_id = ? ");
            params.add(genre_id);
        }
        return this.getValue(sql.toString(), params.toArray()).intValue();  //long转换为int
    }

    @Override
    public List<Album> queryForPageItems(int begin, int pageSize, String albumOrartname, Integer genre_id) {
        StringBuilder sql = new StringBuilder("select * from album where 1=1 ");
        ArrayList<Serializable> params = new ArrayList<>();//保存参数的
        if (genre_id != 0) {
            sql.append("and genre_id = ? ");
            params.add(genre_id);
        }
        if (albumOrartname != null && !"".equals(albumOrartname)) {
            sql.append("and (art_id IN (SELECT id FROM artist WHERE art_name LIKE CONCAT('%',?,'%')) OR album_name LIKE CONCAT('%',?,'%'))");
            params.add(albumOrartname);
            params.add(albumOrartname);
        }
        sql.append(" order by id desc limit ? , ?");
        params.add(begin);
        params.add(pageSize);
        return this.getBeanList(sql.toString(), params.toArray());
    }
}
