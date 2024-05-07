package com.sofftem.service;

import com.sofftem.bean.Album;
import com.sofftem.utils.Page;

import java.util.List;

public interface AlbumService {
    public Album queryAlbumById(Integer id);

    public List<Album> queryAlbumsByArtId(Integer art_id);

    public Page<Album> page(int pageNo, int pageSize, String albumOrartname, Integer genre_id);
}
