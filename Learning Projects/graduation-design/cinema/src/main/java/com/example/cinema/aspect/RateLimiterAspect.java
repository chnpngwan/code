package com.example.cinema.aspect;


import com.example.cinema.annotation.RateLimiter;
import com.example.cinema.utils.IpUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.script.RedisScript;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.lang.reflect.Method;
import java.util.Collections;
import java.util.List;

@Slf4j
@Aspect
@Component
public class RateLimiterAspect {
    @Autowired
    private RedisTemplate<Object, Object> redisTemplate;

    @Autowired
    private RedisScript<Long> limitScript;

    @Before("@annotation(rateLimiter)")
    public void doBefore(JoinPoint point, RateLimiter rateLimiter) {
        String key = rateLimiter.key();
        int time = rateLimiter.time();
        int count = rateLimiter.count();
        String combineKey = getCombineKey(rateLimiter, point);
        List<Object> keys = Collections.singletonList(combineKey);
        Long number = redisTemplate.execute(limitScript, keys, count, time);
        if (number==null || number.intValue() > count) {
            throw new RuntimeException("访问过于频繁，请稍候再试");
        }
        log.info("限制请求'{}',当前请求'{}',缓存key'{}'", count, number.intValue(), key);
    }

    public String getCombineKey(RateLimiter rateLimiter, JoinPoint point) {
        StringBuilder stringBuffer = new StringBuilder(rateLimiter.key());
        stringBuffer.append(IpUtil.getIpAddress(((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest())).append("-");
        MethodSignature signature = (MethodSignature) point.getSignature();
        Method method = signature.getMethod();
        Class<?> targetClass = method.getDeclaringClass();
        stringBuffer.append(targetClass.getName()).append("-").append(method.getName());
        return stringBuffer.toString();
    }
}
