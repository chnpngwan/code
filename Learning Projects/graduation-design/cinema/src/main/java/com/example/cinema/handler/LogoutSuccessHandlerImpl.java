package com.example.cinema.handler;

import com.alibaba.fastjson.JSON;
import com.example.cinema.vo.Response;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class LogoutSuccessHandlerImpl implements LogoutSuccessHandler {

    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response,
                                Authentication authentication) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(Response.success()));
    }

}
