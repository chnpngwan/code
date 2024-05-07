package com.sofftem.servlet;

import com.google.gson.Gson;
import com.sofftem.bean.Event;
import com.sofftem.service.impl.EventServiceImpl;
import com.sofftem.utils.BaseServlet;
import com.sofftem.utils.Page;
import com.sofftem.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/EventsServlet")
public class EventsServlet extends BaseServlet {
    protected void searchEventsPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String events_name = req.getParameter("events_name");
        String genres_val = req.getParameter("genres_val");
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), 6);
//        System.out.println("events_name = " + events_name);
//        System.out.println("genres_val = " + genres_val);
        Page<Event> page = new EventServiceImpl().page(pageNo, pageSize, events_name, genres_val);
        System.out.println("eventspage = " + page);
        resp.setContentType("application/json;charset=utf-8");
        resp.getWriter().print(new Gson().toJson(page));
    }

    protected void toEvent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = WebUtils.parseInt(req.getParameter("id"), 0);
        Event event = new EventServiceImpl().queryEventById(id);
        List<Event> events = new EventServiceImpl().queryEvents();
        req.setAttribute("event", event);
        req.setAttribute("events", events);
        req.getRequestDispatcher("/pages/pag/event.jsp").forward(req, resp);
    }
}