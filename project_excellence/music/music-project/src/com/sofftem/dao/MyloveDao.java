package com.sofftem.dao;

import com.sofftem.bean.Mylove;

import java.util.List;

public interface MyloveDao {
    List<Mylove> findMyloveByUid(Integer uid);

    int deleteMyloveByid(Integer id);

    int saveMylove(Integer music_id, Integer uid);

    Mylove queryMyloveBymusic_idAndUid(Integer music_id, Integer uid);

    int queryForPageTotalCount(Integer uid);

    List<Mylove> queryForPageItems(int begin, int pageSize, int uid);
}
