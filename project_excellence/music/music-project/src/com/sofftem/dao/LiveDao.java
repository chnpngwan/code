package com.sofftem.dao;

import com.sofftem.bean.Live;

import java.util.List;

public interface LiveDao {
    List<Live> queryLiveByArtId(Integer art_id);
    Integer queryForPageTotalCount(String livename, Integer genre_id);

    List<Live> queryForPageItems(int begin, int pageSize, String livename, Integer genre_id);

}
