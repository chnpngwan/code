package com.bbs.interfaces;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * ProjectName:   ssm
 * PackageName:   com.bbs.interfaces
 * ClassName:     LoginHandlerInterceptor
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 06 11 00
 **/


public class LoginHandlerInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //查看session中是否带有用户信息
        handler = request.getSession().getAttribute("customer");
        if(handler==null) {
            request.setAttribute("errmsg", "您还没有登录！请先登录！");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
