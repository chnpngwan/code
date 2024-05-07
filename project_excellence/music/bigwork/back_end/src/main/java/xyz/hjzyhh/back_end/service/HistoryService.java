package xyz.hjzyhh.back_end.service;

import xyz.hjzyhh.back_end.pojo.HistroyPO;
import xyz.hjzyhh.back_end.vo.HistoryVO;

import java.util.List;

public interface HistoryService {
    HistroyPO get(long uid,long vid);
    int updateTime(long id,int time, long option_uid);
    boolean deleteHistory(long id,long option_uid);
    List<HistoryVO> getByUid(long uid, int page);
    List<HistoryVO> getByVid(long vid,long option_uid,int page);
}
