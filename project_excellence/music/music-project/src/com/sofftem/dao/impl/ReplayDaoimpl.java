package com.sofftem.dao.impl;

import com.sofftem.bean.Replay;
import com.sofftem.dao.ReplayDao;
import com.sofftem.utils.BaseDao;

import java.util.List;

public class ReplayDaoimpl extends BaseDao<Replay> implements ReplayDao {
    @Override
    public int updateZanZhen(Integer id) {
        return this.update("update replaycomment set zanzhen = zanzhen + 1 where replay_id = ?", id);
    }

    @Override
    public int updateZanFu(Integer id) {
        return this.update("update replaycomment set zanfu = zanfu + 1 where replay_id = ?", id);
    }

    @Override
    public List<Replay> queryReplayByCommentId(Integer comment_id) {
        return this.getBeanList("select * from replaycomment where comment_id=?", comment_id);
    }

    @Override
    public Integer addReplay(Replay replay) {
        return this.update("insert into replaycomment values(null,?,?,?,0,0,now())",
                replay.getUid(), replay.getComment_id(), replay.getReplaycomment());
    }
}
