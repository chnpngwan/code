package com.sofftem.dao;

import com.sofftem.bean.Album;

import java.util.List;

public interface AlbumDao {
    List<Album> queryAlbumByArtId(Integer art_id);

    Album queryAlbumById(Integer id);

    Integer queryForPageTotalCount(String albumOrartname, Integer genre_id);

    List<Album> queryForPageItems(int begin, int pageSize, String albumOrartname, Integer genre_id);

}
