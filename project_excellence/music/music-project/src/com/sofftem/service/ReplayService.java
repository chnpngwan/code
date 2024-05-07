package com.sofftem.service;

import com.sofftem.bean.Replay;

import java.util.List;

public interface ReplayService {
    int updateZanCount(String info, Integer id);

    int addReplay(Replay replay);

    List<Replay> queryReplayByCommentId(Integer comment_id);
}
