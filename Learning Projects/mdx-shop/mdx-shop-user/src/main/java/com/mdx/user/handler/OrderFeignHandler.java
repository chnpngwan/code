package com.mdx.user.handler;

import com.mdx.user.feign.OrderFeign;
import org.springframework.stereotype.Component;

/**
 * @author : jiagang
 * @date : Created in 2022/7/4 14:07
 */
@Component
public class OrderFeignHandler implements OrderFeign {


    @Override
    public String getOrderNo(String userId, String tenantId, String token) {
        String fallback = "当前人数过多,休息一会再试";
        return fallback;
    }
}
