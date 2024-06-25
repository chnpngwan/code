package com.example.cinema.handler;

import com.alibaba.fastjson.JSON;
import com.example.cinema.enums.StatusCodeEnum;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.example.cinema.vo.Response;


@Component
public class AccessDeniedHandlerImpl implements AccessDeniedHandler {

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response,
                       AccessDeniedException e) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(JSON.toJSONString(Response.failure(StatusCodeEnum.NO_AUTHORIZED)));
    }

}
