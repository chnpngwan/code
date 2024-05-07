package xyz.hjzyhh.back_end.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import xyz.hjzyhh.back_end.pojo.HistroyPO;

import java.util.List;

/**
 * 对历史记录的基本操作
 */
@Mapper
public interface HistoryMapper {
    int createHisttoryLog(@Param("history") HistroyPO histroy);
    int updateHistoryTime(@Param("id")long id,@Param("time")int time,@Param("createTime")long createTime);
    int deleteHistoryLog(@Param("id")long id);
    List<HistroyPO> getByUid(@Param("uid")long uid,@Param("limit") int limit,@Param("offset") long offset);
    List<HistroyPO> getByVid(@Param("vid")long vid,@Param("limit") int limit,@Param("offset") long offset);
    HistroyPO findOneByUidVid(@Param("uid")long uid,@Param("vid")long vid);
    HistroyPO findOneById(@Param("id")long id);
}
