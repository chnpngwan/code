package com.sofftem.dao;

import com.sofftem.bean.Event;

import java.util.List;

public interface EventDao {
    void updateRepertoryAndsale();
    Event queryEventsById(Integer id);
    List<Event> queryEvents();
    Integer queryForPageTotalCount(String events_name,String genres_val);
    List<Event> queryForPageItems(int begin, int pageSize, String events_name,String genres_val);
}
