package com.sofftem.utils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;


public abstract class BaseServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决post表单提交乱码问题
        req.setCharacterEncoding("utf-8");
        String method = req.getParameter("action");
        try {
            Method executeMethod = this.getClass().getDeclaredMethod(method, HttpServletRequest.class, HttpServletResponse.class);
            executeMethod.setAccessible(true);//设置取消访问权限检查
            executeMethod.invoke(this, req, resp);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
