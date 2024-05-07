package com.sofftem.service.impl;

import com.sofftem.bean.Replay;
import com.sofftem.bean.User;
import com.sofftem.dao.ReplayDao;
import com.sofftem.dao.impl.ReplayDaoimpl;
import com.sofftem.service.ReplayService;

import java.util.List;

public class ReplayServiceImpl implements ReplayService {
    ReplayDao replayDao = new ReplayDaoimpl();

    @Override
    public int updateZanCount(String info, Integer id) {
        if (info.equals("点赞")) {
            return replayDao.updateZanZhen(id);
        }
        if (info.equals("踩一下")) {
            return replayDao.updateZanFu(id);
        } else return 0;
    }

    @Override
    public int addReplay(Replay replay) {
        return replayDao.addReplay(replay);
    }

    @Override
    public List<Replay> queryReplayByCommentId(Integer comment_id) {
        List<Replay> replays = replayDao.queryReplayByCommentId(comment_id);
        if (replays != null) {
            for (Replay replay : replays) {
                User user = new UserServiceImpl().queryUserById(replay.getUid());
                replay.setUsername(user.getUsername());
                replay.setUserfaceimg(user.getFaceimg());
            }
        }
        return replays;
    }
}
