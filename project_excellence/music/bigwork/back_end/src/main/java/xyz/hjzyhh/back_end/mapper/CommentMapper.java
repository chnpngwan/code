package xyz.hjzyhh.back_end.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import xyz.hjzyhh.back_end.pojo.CommentPO;

import java.util.List;

/**
 * 评论
 */
@Mapper
public interface CommentMapper {
    int insertComment(@Param("comment")CommentPO comment);
    List<CommentPO> getVideoComments(@Param("vid")long vid, @Param("limit")int limit, @Param("offset")int offset);
    List<CommentPO> getMyComments(@Param("uid")long uid, @Param("limit")int limit, @Param("offset")int offset);
    CommentPO getCommentById(@Param("id") long id);
    int updateContent(@Param("id")long id,@Param("content")String content);
    int deleteComment(@Param("id")long id);
}
