package com.sofftem.dao;

import com.sofftem.bean.Replay;

import java.util.List;

public interface ReplayDao {
    int updateZanZhen(Integer id);
    int updateZanFu(Integer id);
    List<Replay> queryReplayByCommentId(Integer comment_id);
    Integer addReplay(Replay replay);
}
