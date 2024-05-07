package com.sofftem.dao.impl;

import com.sofftem.bean.Event;
import com.sofftem.dao.EventDao;
import com.sofftem.utils.BaseDao;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class EventDaoimpl extends BaseDao<Event> implements EventDao {
    @Override
    public void updateRepertoryAndsale() {
        this.update("update events set repertory = repertory-1 and sale = sale - 1");
    }

    @Override
    public Event queryEventsById(Integer id) {
        return this.getBean("select * from events where id = ? ", id);
    }

    @Override
    public List<Event> queryEvents() {
        return this.getBeanList("select * from events");
    }

    @Override
    public Integer queryForPageTotalCount(String events_name, String genres_val) {
        StringBuilder sql = new StringBuilder("select count(*) from events where 1=1 ");
        ArrayList<Serializable> params = new ArrayList<>();//保存参数的
        if (events_name != null && !"".equals(events_name)) {
            sql.append("and events_name like concat('%',?,'%')");
            params.add(events_name);
        }
        if (genres_val != null && !"".equals(genres_val)) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String format = sdf.format(System.currentTimeMillis());
            switch (genres_val) {
                case "upcoming":
                    sql.append("and datetime >= DATE('").append(format).append("')");
                    break;
                case "past":
                    sql.append("and datetime < DATE('").append(format).append("')");
                    break;
                case "free":
                    sql.append("and tprice = 0.0 ");
                    break;
            }
        }
        return this.getValue(sql.toString(), params.toArray()).intValue();  //long转换为int
    }


    @Override
    public List<Event> queryForPageItems(int begin, int pageSize, String events_name, String genres_val) {
        StringBuilder sql = new StringBuilder("select * from events where 1=1 ");
        ArrayList<Serializable> params = new ArrayList<>();//保存参数的
        if (events_name != null && !"".equals(events_name)) {
            sql.append("and events_name like concat('%',?,'%')");
            params.add(events_name);
        }
        if (genres_val != null && !"".equals(genres_val)) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String format = sdf.format(System.currentTimeMillis());
            switch (genres_val) {
                case "upcoming":
                    sql.append("and datetime >= DATE('").append(format).append("')");
                    break;
                case "past":
                    sql.append("and datetime < DATE('").append(format).append("')");
                    break;
                case "free":
                    sql.append("and tprice = 0.0 ");
                    break;
            }
        }
        sql.append(" order by datetime desc limit ? , ?");
        params.add(begin);
        params.add(pageSize);
        return this.getBeanList(sql.toString(), params.toArray());
    }
}
