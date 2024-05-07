package com.sofftem.servlet;

import com.google.gson.Gson;
import com.sofftem.bean.Mylove;
import com.sofftem.bean.User;
import com.sofftem.service.MyloveService;
import com.sofftem.service.impl.MyloveServiceImpl;
import com.sofftem.utils.BaseServlet;
import com.sofftem.utils.Page;
import com.sofftem.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/MyloveServlet")
public class MyloveServlet extends BaseServlet {
    MyloveService myloveService = new MyloveServiceImpl();

    protected void addMylove(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        int music_id = WebUtils.parseInt(req.getParameter("mid"), 0);
        String msg = myloveService.addMylove(music_id, user.getId());
        resp.setContentType("application/json;charset=utf-8");
        resp.getWriter().print(new Gson().toJson(msg));
    }

    protected void deleteMyloveById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = WebUtils.parseInt(req.getParameter("id"), 0);
        int msg = myloveService.deleteMylove(id);
        resp.setContentType("application/json;charset=utf-8");
        resp.getWriter().print(new Gson().toJson(msg));
    }

    protected void searchMyLovepage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), 5);
        Page<Mylove> page = new MyloveServiceImpl().page(pageNo, pageSize, user.getId());
        System.out.println("Mylovepage = " + page);
        resp.setContentType("application/json;charset=utf-8");
        resp.getWriter().print(new Gson().toJson(page));
    }

}
