package wng.example.service.impl;

import wng.example.base.BaseDao;
import wng.example.base.BaseServiceImpl;
import wng.example.mapper.CommentMapper;
import wng.example.po.Comment;
import wng.example.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl extends BaseServiceImpl<Comment> implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public BaseDao<Comment> getBaseDao() {
        return commentMapper;
    }
}
