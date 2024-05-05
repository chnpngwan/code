package com.szpx.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * uri访问处理
 * 如果访问不存在的uri转到404页面
 */
@Component
public class ErrorPageInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String uri = requestURI.substring(contextPath.length());
        if (uri.equals("/") || uri.startsWith("/ltj") || uri.equals("/lshToFormTableAjaxIndex")||
                uri.equals("/lshAjaxRequest") || uri.startsWith("/lsh") || uri.equals("/lshdataTableTestOne") ||
                uri.equals("/lshjsonData") || uri.equals("/main") || uri.equals("/ulist") || uri.equals("/login")
                || uri.startsWith("/selectById") || uri.startsWith("/delUser") || uri.startsWith("/toUpdateUser")
                || uri.startsWith("/updateUser")){
            return true;
        }else if (uri.endsWith(".css") || uri.endsWith(".js")){
            return true;
        }else {
            request.getRequestDispatcher("/ltj/page404").forward(request,response);
            return false;
        }
    }
}
