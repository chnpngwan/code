package xyz.hjzyhh.back_end.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import xyz.hjzyhh.back_end.pojo.TagPO;
import xyz.hjzyhh.back_end.pojo.TagVideoPO;
import xyz.hjzyhh.back_end.pojo.VideoPO;

import java.util.List;

/**
 * 视频元数据的增删改查
 */
@Mapper
public interface VideoMapper {
    int insert(@Param("video") VideoPO video);

    int delete(@Param("vid") long vid);

    int update(@Param("vid") long vid, @Param("video") VideoPO video);

    VideoPO findById(@Param("vid") long vid);

    List<VideoPO> findMine(@Param("uid") long uid, @Param("limit") int limit, @Param("offset") int offset);

    List<VideoPO> findByCreator(@Param("uid") long uid, @Param("limit") int limit, @Param("offset") int offset);

    List<VideoPO> findRange(@Param("offset") long offset, @Param("limit") int limit); // 范围查询 用于做首页推荐

    int submitReview(@Param("vid") long vid);

    // 根据视频ID获取对应tagID
    List<Integer> getVideoTags(@Param("vid") long vid);

    // 根据Tag获取视频ID
    List<Long> getTagVideos(@Param("tid") int tid,
                            @Param("limit") int limit,
                            @Param("offset") long offset);

    // 添加视频tag
    int addVideoTag(@Param("vid") long vid, @Param("tid") int tid);

    List<VideoPO> getVideoByClass(@Param("cid") int cid);

    int updateVideoUrl(@Param("vid")long vid,@Param("video")String video);
}
