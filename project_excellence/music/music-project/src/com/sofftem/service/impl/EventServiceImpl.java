package com.sofftem.service.impl;

import com.sofftem.bean.Event;
import com.sofftem.dao.EventDao;
import com.sofftem.dao.impl.EventDaoimpl;
import com.sofftem.service.EventService;
import com.sofftem.utils.Page;

import java.util.List;

public class EventServiceImpl implements EventService {
    EventDao eventDao = new EventDaoimpl();

    @Override
    public void updateEvent() {
        eventDao.updateRepertoryAndsale();
    }

    @Override
    public Event queryEventById(Integer id) {
        Event event = eventDao.queryEventsById(id);
        if (event.getRepertory() == 0) {
            event.setState(0);
        } else {
            event.setState(1);
        }
        return event;
    }

    @Override
    public List<Event> queryEvents() {
        List<Event> events = eventDao.queryEvents();
        for (Event event : events) {
            if (event.getRepertory() == 0) {
                event.setState(0);
            } else {
                event.setState(1);
            }
            String datetime = String.valueOf(event.getDatetime()); // 获取datetime的值
            String date = datetime.substring(0, 11);
            String time = datetime.substring(11, 18); // 从第11个字符开始截取后面的部分，即时间部分
            event.setDate(date);
            event.setTime(time);
        }
        return events;
    }

    @Override
    public Page<Event> page(int pageNo, int pageSize, String events_name, String genres_val) {
        Page<Event> page = new Page<>();
        page.setPageNo(pageNo);
        page.setPageSize(pageSize);
        page.setPageTotalCount(eventDao.queryForPageTotalCount(events_name, genres_val));//求出最大页
        if (page.getPageTotalCount() % page.getPageSize() == 0) {
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
        List<Event> events = eventDao.queryForPageItems(begin, page.getPageSize(),events_name, genres_val);
        for (Event event : events) {//状态
            event.setIntroduction(null);
            if (event.getRepertory() == 0) {
                event.setState(0);
            } else {
                event.setState(1);
            }
            String datetime = String.valueOf(event.getDatetime()); // 获取datetime的值
            String date = datetime.substring(0, 11);
            String time = datetime.substring(11, 16); // 从第11个字符开始截取后面的部分，即时间部分
            event.setDate(date);
            event.setTime(time);
        }
        page.setItems(events);//将查询出来的结果集对象保存到page中
        return page;
    }
}
