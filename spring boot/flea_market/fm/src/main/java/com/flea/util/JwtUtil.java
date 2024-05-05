package com.flea.util;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.flea.entity.User;
import com.flea.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * jwt工具类
 */
@Component
public class JwtUtil {

    private static UserService staticUserService;

    @Autowired
    private UserService userService;

    @PostConstruct
    public void setUserService(){
        staticUserService = userService;
    }

    /**
     * 生成token
     * @param user
     * @return
     */
    public static String getToken(User user) {
        return JWT.create().withAudience((user.getId().toString()))
                .withExpiresAt(DateUtil.offsetHour(new Date(), 2))
                .sign(Algorithm.HMAC256(user.getPassword()));
    }

    /**
     * 获取当前登录的用户信息
     * @return
     */
    public static User getCurrentUser(){
        User user = new User();
        try{
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            String token = request.getHeader("token");
            if (StrUtil.isNotBlank(token)) {
                String userId = JWT.decode(token).getAudience().get(0);
                user = staticUserService.getById(userId);
            }
        }catch (Exception e) {
            return null;
        }
        return user;
    }

}
