package com.sofftem.dao.impl;

import com.sofftem.bean.Artist;
import com.sofftem.dao.ArtistDao;
import com.sofftem.utils.BaseDao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ArtistDaoImpl extends BaseDao<Artist> implements ArtistDao {
    @Override
    public List<Artist> queryArtist() {
        return this.getBeanList("select * from artist");
    }

    @Override
    public Artist queryArtistById(Integer id) {
        return this.getBean("select * from artist where id = ? ", id);
    }

    @Override
    public Integer queryForPageTotalCount(String art_name, Integer genre_id) {
        StringBuilder sql = new StringBuilder("select count(*) from artist where 1=1 ");
        ArrayList<Serializable> params = new ArrayList<>();//保存参数的
        if (art_name != null && !"".equals(art_name)) {
            sql.append("and art_name like concat('%',?,'%') ");
            params.add(art_name);
        }
        if (genre_id != 0) {
            sql.append("and genre_id = ? ");
            params.add(genre_id);
        }
        return Math.toIntExact(this.getValue(sql.toString(), params.toArray())); //long转换为int
    }

    @Override
    public List queryForPageItems(int begin, int pageSize, String art_name, Integer genre_id) {
        StringBuilder sql = new StringBuilder("select * from artist where 1=1 ");
        ArrayList<Serializable> params = new ArrayList<>();//保存参数的
        if (art_name != null && !"".equals(art_name)) {
            sql.append("and art_name like concat('%',?,'%') ");
            params.add(art_name);
        }
        if (genre_id != 0) {
            sql.append("and genre_id = ? ");
            params.add(genre_id);
        }
        sql.append(" order by id desc limit ? , ?");
        params.add(begin);
        params.add(pageSize);
        List<Artist> artistList = this.getBeanList(sql.toString(), params.toArray());
        List<Map<String, Object>> mapList = new ArrayList<>();
        for (Artist artist : artistList) {
            Map<String, Object> map = new HashMap<>();
            map.put("id", artist.getId());
            map.put("photograph", artist.getPhotograph());
            map.put("art_name", artist.getArt_name());
            mapList.add(map);
        }
        return mapList;
    }
}
