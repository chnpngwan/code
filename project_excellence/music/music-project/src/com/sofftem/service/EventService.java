package com.sofftem.service;

import com.sofftem.bean.Event;
import com.sofftem.utils.Page;

import java.util.List;

public interface EventService {
    void updateEvent();

    Event queryEventById(Integer id);

    List<Event> queryEvents();

    Page<Event> page(int pageNo, int pageSize, String events_name, String genres_val);
}
