package com.example.cinema.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.cinema.constant.CommonConstant;
import com.example.cinema.dto.CommentReviewDTO;
import com.example.cinema.entity.Comment;
import com.example.cinema.entity.User;
import com.example.cinema.mapper.CommentMapper;
import com.example.cinema.mapper.UserMapper;
import com.example.cinema.service.CommentService;
import com.example.cinema.utils.BeanCopyUtil;
import com.example.cinema.utils.PageUtil;
import com.example.cinema.vo.CommentFrontVO;
import com.example.cinema.vo.CommentVO;
import com.example.cinema.vo.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public PageResult<CommentVO> getCommentPage(String keywords, Integer movieId) {
        List<CommentVO> commentVOList = baseMapper.getCommentPage(PageUtil.getLimitCurrent(),
                PageUtil.getSize(), keywords, movieId);
        Long total = baseMapper.getCommentPageTotal(keywords, movieId);
        return new PageResult<>(commentVOList, total);
    }

    @Override
    public PageResult<CommentFrontVO> getCommentFrontVOByMovieId(Integer movieId) {
        Page<Comment> page = new Page<>(PageUtil.getCurrent(), PageUtil.getSize());
        Page<Comment> commentPage = baseMapper.selectPage(page, new LambdaQueryWrapper<Comment>()
                .eq(Comment::getMovieId, movieId)
                .eq(Comment::getReviewFlag, CommonConstant.TRUE));
        List<CommentFrontVO> commentFrontVOList = commentPage.getRecords().stream().map(item -> {
            CommentFrontVO commentFrontVO = BeanCopyUtil.copyObject(item, CommentFrontVO.class);
            User user = userMapper.selectById(item.getUserId());
            commentFrontVO.setUser(user);
            return commentFrontVO;
        }).collect(Collectors.toList());
        return new PageResult<>(commentFrontVOList, commentPage.getTotal());
    }

    @Override
    public boolean reviewCommentById(CommentReviewDTO commentReviewDTO) {
        List<Comment> comments = baseMapper.selectBatchIds(commentReviewDTO.getCommentIds());
        comments.forEach(comment -> {
            comment.setReviewFlag(commentReviewDTO.getReviewFlag());
            comment.setUpdateTime(LocalDateTime.now());
        });
        return updateBatchById(comments);
    }
}
