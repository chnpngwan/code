package com.sofftem.dao.impl;

import com.sofftem.bean.Comment;
import com.sofftem.dao.CommentDao;
import com.sofftem.utils.BaseDao;

import java.util.List;

public class CommentDaoImpl extends BaseDao<Comment> implements CommentDao {
    @Override
    public int updateZanZhen(Integer id) {
        return this.update("update comment set zanzhen = zanzhen + 1 where id = ?", id);
    }

    @Override
    public int updateZanFu(Integer id) {
        return this.update("update comment set zanfu = zanfu + 1 where id = ?", id);
    }

    @Override
    public Integer addComment(Comment comment) {
        return this.update("insert into comment values(null,?,?,0,0,?,now())",
                comment.getUid(), comment.getComment(), comment.getAlbum_id());
    }

    @Override
    public Integer queryForPageTotalCount(Integer album_id) {
        return this.getValue("select count(*) from comment where album_id = ?", album_id).intValue();
    }

    @Override
    public List<Comment> queryForPageItems(int begin, int pageSize, Integer album_id) {
        return this.getBeanList("select * from comment where album_id = ? order by regtime desc limit ?,?", album_id, begin, pageSize);
    }
}
