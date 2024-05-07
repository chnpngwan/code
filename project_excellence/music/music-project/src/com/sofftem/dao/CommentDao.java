package com.sofftem.dao;

import com.sofftem.bean.Comment;

import java.util.List;

public interface CommentDao {
    int updateZanZhen(Integer id);

    int updateZanFu(Integer id);

    Integer addComment(Comment comment);

    Integer queryForPageTotalCount(Integer album_id);

    List<Comment> queryForPageItems(int begin, int pageSize, Integer album_id);
}
