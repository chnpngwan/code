package com.example.cinema.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.cinema.entity.Comment;
import com.example.cinema.vo.CommentVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CommentMapper extends BaseMapper<Comment> {
    List<CommentVO> getCommentPage(@Param("start") Long start,
                                   @Param("size") Long size,
                                   @Param("keywords") String keywords,
                                   @Param("movieId") Integer movieId);
    Long getCommentPageTotal(@Param("keywords") String keywords,
                             @Param("movieId") Integer movieId);
}
