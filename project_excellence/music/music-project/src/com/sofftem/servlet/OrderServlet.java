package com.sofftem.servlet;

import com.google.gson.Gson;
import com.sofftem.bean.Order;
import com.sofftem.bean.User;
import com.sofftem.service.impl.OrderServiceImpl;
import com.sofftem.utils.BaseServlet;
import com.sofftem.utils.Page;
import com.sofftem.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/OrderServlet")
public class OrderServlet extends BaseServlet {
    protected void createOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ids = req.getParameter("ids");
        String[] split = ids.split(",");
        List<Integer> list = new ArrayList<>();
        for (String s : split) {
            list.add(Integer.parseInt(s));
        }
        User user = (User) req.getSession().getAttribute("user");
        new OrderServiceImpl().createOrder(list, user.getId());
        req.getRequestDispatcher("/pages/pag/profile.jsp").forward(req, resp);
    }

    protected void toOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), 12);
        Page<Order> page = new OrderServiceImpl().page(pageNo, pageSize, user.getId());
//        System.out.println("page = " + page);
        resp.setContentType("application/json;charset=utf-8");
        resp.getWriter().print(new Gson().toJson(page));
    }
}
