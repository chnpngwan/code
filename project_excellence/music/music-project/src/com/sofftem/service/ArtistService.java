package com.sofftem.service;

import com.sofftem.bean.Artist;
import com.sofftem.utils.Page;

public interface ArtistService {
    public Artist queryArtistById(Integer id);

    public Page<Artist> page(int pageNo, int pageSize, String album_name, Integer genre_id);
}
