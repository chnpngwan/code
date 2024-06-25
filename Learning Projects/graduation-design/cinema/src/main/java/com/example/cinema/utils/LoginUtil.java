package com.example.cinema.utils;


import com.example.cinema.vo.UserDetailVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;


@Component
public class LoginUtil {

    /**
     * 获取当前登录用户
     *
     * @return 用户登录信息
     */
    public static UserDetailVO getLoginUser() {
        return (UserDetailVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }

}
