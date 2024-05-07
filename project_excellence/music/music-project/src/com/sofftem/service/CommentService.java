package com.sofftem.service;

import com.sofftem.bean.Comment;
import com.sofftem.utils.Page;

public interface CommentService {
    int updateZanCount(String info,Integer id);
    Integer addComment(Comment comment);

    Page<Comment> page(int pageNo, int pageSize, Integer album_id);
}
