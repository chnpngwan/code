package xyz.hjzyhh.back_end.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.hjzyhh.back_end.mapper.HistoryMapper;
import xyz.hjzyhh.back_end.pojo.HistroyPO;
import xyz.hjzyhh.back_end.pojo.VideoPO;
import xyz.hjzyhh.back_end.scheduled.HistoryAsyncSchedul;
import xyz.hjzyhh.back_end.service.HistoryService;
import xyz.hjzyhh.back_end.service.UserService;
import xyz.hjzyhh.back_end.service.VideoService;
import xyz.hjzyhh.back_end.utils.RedisUtil;
import xyz.hjzyhh.back_end.utils.VOUtil;
import xyz.hjzyhh.back_end.vo.HistoryVO;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class HistoryServiceImpl implements HistoryService {

    private final int PAGE_LIMIT = 20;

    @Autowired
    HistoryMapper historyMapper;

    @Autowired
    VideoService videoService;

    @Autowired
    UserService userService;

    @Autowired
    HistoryAsyncSchedul historyAsyncSchedul;

    @Override
    public HistroyPO get(long uid, long vid) {
        HistroyPO histroyPO = historyMapper.findOneByUidVid(uid, vid);
        if(histroyPO == null){
            histroyPO = new HistroyPO();
            histroyPO.setId(RedisUtil.getId("history"));
            histroyPO.setUid(uid);
            histroyPO.setVid(vid);
            histroyPO.setTime(0);
            histroyPO.setCreateTime(System.currentTimeMillis()/1000);
            historyMapper.createHisttoryLog(histroyPO);
            RedisUtil.HistoryUtils.setHistory(histroyPO.getId(),histroyPO);
        }else{
            HistroyPO history = RedisUtil.HistoryUtils.getHistory(histroyPO.getId());
            if(history != null){
                return history;
            }
            histroyPO.setCreateTime(System.currentTimeMillis()/1000);
            RedisUtil.HistoryUtils.setHistory(histroyPO.getId(),histroyPO);
            return histroyPO;
        }
        return histroyPO;
    }

    private HistroyPO get(long id) {
        HistroyPO history = RedisUtil.HistoryUtils.getHistory(id);
        if(history == null){
            history = historyMapper.findOneById(id);
        }
        return history;
    }

    @Override
    public int updateTime(long id, int time, long option_uid) {
        HistroyPO history = get(id);
        if(history.getUid() == option_uid) {
            history.setTime(time);
            RedisUtil.HistoryUtils.setHistory(history.getId(), history);
            historyAsyncSchedul.historyKeys.add(id);
            return time;
        }else throw new RuntimeException("没权限");
    }

    @Override
    public boolean deleteHistory(long id, long option_uid) {
        HistroyPO history = get(id);
        if(history.getUid() == option_uid){
            RedisUtil.HistoryUtils.delHistory(id);
            int i = historyMapper.deleteHistoryLog(id);
            if(i == 1)
                return true;
            else  return false;
        }
        throw new RuntimeException("没权限");
    }

    @Override
    public List<HistoryVO> getByUid(long uid, int page) {
        List<HistroyPO> histroyPOList = historyMapper.getByUid(uid, PAGE_LIMIT, PAGE_LIMIT * (page - 1));
        return histroyPOList.stream().map(histroyPO -> {
            HistroyPO history = RedisUtil.HistoryUtils.getHistory(histroyPO.getId());
            if(history!=null){
                histroyPO = history;
            }
            HistoryVO historyVO = VOUtil.swap(histroyPO, HistoryVO.class);
            historyVO.setVideo(videoService.getVideoPOById(histroyPO.getVid()));
            return historyVO;
        }).collect(Collectors.toList());
    }

    @Override
    public List<HistoryVO> getByVid(long vid, long option_uid, int page) {
        VideoPO videoPO = videoService.getVideoPOById(vid);
        if(videoPO.getCreator() == option_uid){
            List<HistroyPO> histroyPOS = historyMapper.getByVid(vid, PAGE_LIMIT, PAGE_LIMIT * (page - 1));
            return histroyPOS.stream().map(histroyPO -> {
                HistoryVO historyVO = VOUtil.swap(histroyPO, HistoryVO.class);
                historyVO.setUser(userService.findOne(histroyPO.getUid()));
                return historyVO;
            }).collect(Collectors.toList());
        }else{
            throw new RuntimeException("没权限");
        }
    }
}
