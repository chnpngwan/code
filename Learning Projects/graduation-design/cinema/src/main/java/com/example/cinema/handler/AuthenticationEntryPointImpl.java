package com.example.cinema.handler;

import com.alibaba.fastjson.JSON;
import com.example.cinema.enums.StatusCodeEnum;
import com.example.cinema.vo.Response;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;



@Component
public class AuthenticationEntryPointImpl implements AuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response,
                         AuthenticationException e) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(Response.failure(StatusCodeEnum.NO_LOGIN)));
    }

}
