package com.wng.login.component;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginHandInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
            Object user = request.getSession().getAttribute("loginUser");
        return HandlerInterceptor.super.preHandle(request, response, handler);
    }
}
