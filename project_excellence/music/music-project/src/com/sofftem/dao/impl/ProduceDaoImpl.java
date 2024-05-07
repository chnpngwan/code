package com.sofftem.dao.impl;

import com.sofftem.bean.Produce;
import com.sofftem.dao.ProduceDao;
import com.sofftem.utils.BaseDao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ProduceDaoImpl extends BaseDao<Produce> implements ProduceDao {
    @Override
    public int updateProduce(Produce produce) {
        String sql = "UPDATE produce SET repertory = ? and sale = ? WHERE id= ?;";
        return this.update(sql, produce.getRepertory(), produce.getSale(), produce.getId());
    }

    @Override
    public Produce queryProduceById(Integer id) {
        return this.getBean("select * from produce where id = ? ", id);
    }

    @Override
    public List<Produce> queryProduceByFGenreId(Integer genre_id) {
        return this.getBeanList("select * from produce where genre_id = ? ", genre_id);
    }

    @Override
    public Integer queryForPageTotalCount(String pname, Integer genre_id) {
        StringBuilder sql = new StringBuilder("select count(*) from produce where 1=1 ");
        ArrayList<Serializable> params = new ArrayList<>();//保存参数的
        if (pname != null && !"".equals(pname)) {
            sql.append("and pname like concat('%',?,'%')");
            params.add(pname);
        }
        if (genre_id != 0) {
            sql.append("and genre_id = ? ");
            params.add(genre_id);
        }
        return this.getValue(sql.toString(), params.toArray()).intValue();  //long转换为int
    }

    @Override
    public List<Produce> queryForPageItems(int begin, int pageSize, String pname, Integer genre_id) {
        StringBuilder sql = new StringBuilder("select * from produce where 1=1 ");
        ArrayList<Serializable> params = new ArrayList<>();//保存参数的
        if (pname != null && !"".equals(pname)) {
            sql.append("and pname like concat('%',?,'%')");
            params.add(pname);
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
