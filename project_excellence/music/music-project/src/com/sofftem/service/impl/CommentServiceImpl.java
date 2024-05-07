package com.sofftem.service.impl;

import com.sofftem.bean.Comment;
import com.sofftem.bean.User;
import com.sofftem.dao.CommentDao;
import com.sofftem.dao.impl.CommentDaoImpl;
import com.sofftem.service.CommentService;
import com.sofftem.utils.Page;

import java.util.List;

public class CommentServiceImpl implements CommentService {
    CommentDao commentDao = new CommentDaoImpl();

    @Override
    public int updateZanCount(String info,Integer id) {
        if (info.equals("点赞")) {
            return commentDao.updateZanZhen(id);
        }
        if (info.equals("踩一下")) {
            return commentDao.updateZanFu(id);
        } else return 0;
    }

    @Override
    public Integer addComment(Comment comment) {
        return commentDao.addComment(comment);
    }

    @Override
    public Page<Comment> page(int pageNo, int pageSize, Integer album_id) {
        Page<Comment> page = new Page<>();
        page.setPageNo(pageNo);
        page.setPageSize(pageSize);
        page.setPageTotalCount(commentDao.queryForPageTotalCount(album_id));
        if (page.getPageTotalCount() % page.getPageSize() == 0) {//求出最大页
            page.setPageTotal(page.getPageTotalCount() / pageSize);//使用  [总记录数 / 当前页显示数量 = 总页数]
        } else {
            page.setPageTotal(page.getPageTotalCount() / pageSize + 1);//如果除不净的话,就需要+1  [总记录数 / 当前页显示数量 = 总页数 + 1]
        }
        if (page.getPageNo() > page.getPageTotal()) {//如果当前页大于最大页
            page.setPageNo(page.getPageTotal());//就将最大页设置给当前页
        }
        if (page.getPageNo() < 1) {
            page.setPageNo(1);
        }
        int begin = (page.getPageNo() - 1) * page.getPageSize();
        List<Comment> comments = commentDao.queryForPageItems(begin, page.getPageSize(), album_id);
        for (Comment comment : comments) {
            User user = new UserServiceImpl().queryUserById(comment.getUid());
            comment.setReplay(new ReplayServiceImpl().queryReplayByCommentId(comment.getId()));
            comment.setUsername(user.getUsername());
            comment.setUserfaceimg(user.getFaceimg());
        }
        page.setItems(comments);//将查询出来的结果集对象保存到page中
        return page;
    }
}
