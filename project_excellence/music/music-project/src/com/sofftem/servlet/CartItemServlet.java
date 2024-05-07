package com.sofftem.servlet;

import com.google.gson.Gson;
import com.sofftem.bean.CartItem;
import com.sofftem.bean.User;
import com.sofftem.service.CartItemService;
import com.sofftem.service.impl.CartItemServiceImpl;
import com.sofftem.utils.BaseServlet;
import com.sofftem.utils.Page;
import com.sofftem.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/CartItemServlet")
public class CartItemServlet extends BaseServlet {
    CartItemService cartItemService = new CartItemServiceImpl();

    protected void updateCountTotalPrice(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = WebUtils.parseInt(req.getParameter("id"), 0);
        int count = WebUtils.parseInt(req.getParameter("count"), 1);
        cartItemService.updateItemCountById(id, count);
        Double totalPrice = cartItemService.findItemById(id).getTotalPrice();
        resp.setContentType("application/json;charset=utf-8");
        resp.getWriter().print(new Gson().toJson(totalPrice));
    }


    protected void clearCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        cartItemService.deleteItemByUid(user.getId());
        resp.getWriter().print(new Gson().toJson("清空成功"));
    }

    protected void deleteById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=utf-8");
        Integer id = WebUtils.parseInt(req.getParameter("id"), 0);
        int i = cartItemService.deleteItemById(id);
        resp.getWriter().print(new Gson().toJson(i));
    }

    protected void findCartByUid(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), 8);
        Page<CartItem> page;
        if (user != null) {
            page = cartItemService.page(pageNo, pageSize, user.getId());
        } else page = null;
//        System.out.println("pagefindcart = " + page);
        resp.setContentType("application/json;charset=utf-8");
        resp.getWriter().print(new Gson().toJson(page));
    }

    protected void addItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pid = WebUtils.parseInt(req.getParameter("pid"), 0);
        int count = WebUtils.parseInt(req.getParameter("count"), 0);
        User user = (User) req.getSession().getAttribute("user");
        int ms = 0;
        if (user != null) {
            ms = cartItemService.addItem(pid, count, user.getId());
        }
        resp.setContentType("application/json;charset=utf-8");
        resp.getWriter().print(new Gson().toJson(ms));
    }
}
