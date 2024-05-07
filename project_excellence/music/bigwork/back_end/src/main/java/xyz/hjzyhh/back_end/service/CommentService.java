package xyz.hjzyhh.back_end.service;

import xyz.hjzyhh.back_end.vo.CommentVO;

import java.util.List;

public interface CommentService {
    CommentVO insertComment(long uid,long vid,String content);
    List<CommentVO> getVideoComments(long vid, int page);
    List<CommentVO> getMyComments(long uid,int page);
    CommentVO getById(long id);
    CommentVO updateContent(long id,String content,long option_uid);
    boolean deleteComment(long id,long option_uid);
}
