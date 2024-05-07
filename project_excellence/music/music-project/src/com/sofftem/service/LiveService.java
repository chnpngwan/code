package com.sofftem.service;

import com.sofftem.bean.Live;
import com.sofftem.utils.Page;

import java.util.List;

public interface LiveService {
    public List<Live> queryLivesByArtId(Integer art_id);

    public Page<Live> page(int pageNo, int pageSize, String livename, Integer genre_id);
}
