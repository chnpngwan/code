package com.sofftem.dao;

import com.sofftem.bean.Artist;

import java.util.List;
import java.util.Map;

public interface ArtistDao {
    List<Artist> queryArtist() ;

    Artist queryArtistById(Integer id) ;

    Integer queryForPageTotalCount(String name, Integer genre_id) ;

    List<Map<String, Object>> queryForPageItems(int begin, int pageSize, String album_name, Integer genre_id);
}
