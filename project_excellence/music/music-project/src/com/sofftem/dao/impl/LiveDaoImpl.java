package com.sofftem.dao.impl;

import com.sofftem.bean.Live;
import com.sofftem.dao.LiveDao;
import com.sofftem.utils.BaseDao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class LiveDaoImpl extends BaseDao<Live> implements LiveDao {
    @Override
    public List<Live> queryLiveByArtId(Integer art_id) {
        return this.getBeanList("select * from live where art_id = ?", art_id);
    }

    @Override
    public Integer queryForPageTotalCount(String livename, Integer genre_id) {
        StringBuilder sql = new StringBuilder("select count(*) from live where 1=1 ");
        ArrayList<Serializable> params = new ArrayList<>();//保存参数的
        if (livename != null && !"".equals(livename)) {
            sql.append("and live_name like concat('%',?,'%')");
            params.add(livename);
        }
        if (genre_id != 0) {
            sql.append("and genre_id = ? ");
            params.add(genre_id);
        }
        return this.getValue(sql.toString(), params.toArray()).intValue();  //long转换为int
    }


    @Override
    public List<Live> queryForPageItems(int begin, int pageSize, String livename, Integer genre_id) {
        StringBuilder sql = new StringBuilder("select * from live where 1=1 ");
        ArrayList<Serializable> params = new ArrayList<>();//保存参数的
        if (livename != null && !"".equals(livename)) {
            sql.append("and live_name like concat('%',?,'%')");
            params.add(livename);
        }
        if (genre_id != 0) {
            sql.append("and genre_id = ? ");
            params.add(genre_id);
        }
        sql.append(" order by id desc limit ? , ?");
        params.add(begin);
        params.add(pageSize);
        return this.getBeanList(sql.toString(), params.toArray());
    }
}
