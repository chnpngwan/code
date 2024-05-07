package com.sofftem.dao.impl;

import com.sofftem.bean.Mylove;
import com.sofftem.dao.MyloveDao;
import com.sofftem.utils.BaseDao;

import java.util.List;

public class MyloveDaoImpl extends BaseDao<Mylove> implements MyloveDao {
    @Override
    public List<Mylove> findMyloveByUid(Integer uid) {
        return this.getBeanList("select * from mylovemusic where uid = ?", uid);
    }

    @Override
    public int deleteMyloveByid(Integer id) {
        return this.update("DELETE FROM mylovemusic WHERE id = ? ", id);
    }

    @Override
    public int saveMylove(Integer music_id, Integer uid) {
        return this.update("insert into mylovemusic values(null,?,?)", music_id, uid);
    }

    @Override
    public Mylove queryMyloveBymusic_idAndUid(Integer music_id, Integer uid) {
        return this.getBean("select * from mylovemusic where music_id = ? and uid = ?", music_id, uid);
    }

    @Override
    public int queryForPageTotalCount(Integer uid) {
        return this.getValue("select count(*) from mylovemusic where uid = ?", uid).intValue();
    }

    @Override
    public List<Mylove> queryForPageItems(int begin, int pageSize, int uid) {
        return this.getBeanList("select * from mylovemusic where uid = ? order by id desc limit ?,?", uid, begin, pageSize);
    }
}
