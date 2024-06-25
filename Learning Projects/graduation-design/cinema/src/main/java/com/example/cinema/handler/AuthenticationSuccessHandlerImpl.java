package com.example.cinema.handler;

import com.alibaba.fastjson.JSON;
import com.example.cinema.utils.BeanCopyUtil;
import com.example.cinema.utils.LoginUtil;
import com.example.cinema.vo.Response;
import com.example.cinema.vo.UserVO;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class AuthenticationSuccessHandlerImpl implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        UserVO userVO = BeanCopyUtil.copyObject(LoginUtil.getLoginUser(), UserVO.class);
        response.getWriter().write(JSON.toJSONString(Response.success(userVO)));
    }

}
