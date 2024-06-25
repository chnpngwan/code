package com.example.cinema.handler;

import com.alibaba.fastjson.JSON;
import com.example.cinema.vo.Response;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Component
public class AuthenticationFailHandlerImpl implements AuthenticationFailureHandler {
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                        AuthenticationException e) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(Response.failure(e.getMessage())));
    }

}
