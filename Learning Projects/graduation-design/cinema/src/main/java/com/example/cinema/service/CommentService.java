package com.example.cinema.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.cinema.dto.CommentReviewDTO;
import com.example.cinema.entity.Comment;
import com.example.cinema.vo.CommentFrontVO;
import com.example.cinema.vo.CommentVO;
import com.example.cinema.vo.PageResult;

import java.util.List;


public interface CommentService extends IService<Comment> {
    PageResult<CommentVO> getCommentPage(String keywords, Integer movieId);
    PageResult<CommentFrontVO> getCommentFrontVOByMovieId(Integer movieId);
    boolean reviewCommentById(CommentReviewDTO commentReviewDTO);
}
