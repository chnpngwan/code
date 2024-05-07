package xyz.hjzyhh.back_end.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.hjzyhh.back_end.mapper.CommentMapper;
import xyz.hjzyhh.back_end.pojo.CommentPO;
import xyz.hjzyhh.back_end.pojo.VideoPO;
import xyz.hjzyhh.back_end.service.CommentService;
import xyz.hjzyhh.back_end.service.UserService;
import xyz.hjzyhh.back_end.service.VideoService;
import xyz.hjzyhh.back_end.utils.RedisUtil;
import xyz.hjzyhh.back_end.utils.VOUtil;
import xyz.hjzyhh.back_end.vo.CommentVO;
import xyz.hjzyhh.back_end.vo.UserVO;

import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
public class CommentServiceImpl implements CommentService {

    private final int PAGE_LIMIT = 20;

    @Autowired
    CommentMapper commentMapper;

    @Autowired
    UserService userService;

    @Autowired
    VideoService videoService;

    private CommentPO buildCommentPO(long id,long uid, long vid, String content){
        CommentPO comment = new CommentPO();
        comment.setId(id);
        comment.setVid(vid);
        comment.setUid(uid);
        comment.setContent(content);
        return comment;
    }

    private CommentVO buildCommentVOByPO(CommentPO comment){
        VideoPO video = videoService.getVideoPOById(comment.getVid());
        CommentVO commentVO = VOUtil.swap(comment, CommentVO.class);
        commentVO.setVideo(video);
        commentVO.setUser(VOUtil.swap(userService.findOne(comment.getUid()), UserVO.class));
        return commentVO;
    }


    @Override
    public CommentVO insertComment(long uid, long vid, String content) {
        long comment_id = RedisUtil.getId("COMMENT_ID");
        int i = commentMapper.insertComment(buildCommentPO(comment_id,uid,vid,content));
        if(i == 1){
            return getById(comment_id);
        }
        return null;
    }

    @Override
    public List<CommentVO> getVideoComments(long vid, int page) {
        List<CommentPO> comments = commentMapper.getVideoComments(vid,PAGE_LIMIT,PAGE_LIMIT*(page-1));
        VideoPO video = videoService.getVideoPOById(vid);
        List<CommentVO> commentVOS = comments.stream()
                .map(this::buildCommentVOByPO)
                .collect(Collectors.toList());
        return commentVOS;
    }

    @Override
    public List<CommentVO> getMyComments(long uid, int page) {
        List<CommentPO> comments = commentMapper.getMyComments(uid, PAGE_LIMIT, PAGE_LIMIT * (page - 1));
        return comments.stream().map(this::buildCommentVOByPO).collect(Collectors.toList());
    }

    private CommentPO getCommentPOById(long id){
        CommentPO comment = RedisUtil.CommentUtils.getComment(id);
        if(comment == null){
            comment = commentMapper.getCommentById(id);
            if(comment == null)return null;
            RedisUtil.CommentUtils.setComment(comment.getId(),comment);
        }
        return comment;
    }

    @Override
    public CommentVO getById(long id) {
        CommentPO comment = getCommentPOById(id);
        CommentVO commentVO = VOUtil.swap(comment, CommentVO.class);
        commentVO.setUser(VOUtil.swap(userService.findOne(comment.getUid()), UserVO.class));
        commentVO.setVideo(videoService.getVideoPOById(comment.getVid()));
        return commentVO;
    }

    @Override
    public CommentVO updateContent(long id, String content, long option_uid) {
        CommentPO comment = getCommentPOById(id);
        if(comment.getUid() != option_uid) throw new RuntimeException("无权限");
        commentMapper.updateContent(id,content);
        comment = commentMapper.getCommentById(comment.getId());
        RedisUtil.CommentUtils.setComment(comment.getId(),comment);
        return getById(comment.getId());
    }

    @Override
    public boolean deleteComment(long id, long option_uid) {
        CommentPO comment = getCommentPOById(id);
        if(comment.getUid() != option_uid) throw new RuntimeException("无权限");
        return commentMapper.deleteComment(id) == 1;
    }
}
