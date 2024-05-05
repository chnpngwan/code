package com.demo.redis.config;

import com.demo.redis.bean.User;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;

/**
 * ProjectName:  spring boot
 * PackageName:  com.demo.redis.config
 * ClassName:    RedisConfig
 *
 * @Author chnpngwng
 * @Date 2023 06 05 15 23
 **/

@Configuration
public class RedisConfig {

    @Bean
    public RedisTemplate<Object, User> configure(RedisConnectionFactory reactiveConnectionFactory) {
        RedisTemplate<Object, User> template = new RedisTemplate<Object, User>();
        template.setConnectionFactory(reactiveConnectionFactory);
        Jackson2JsonRedisSerializer<User> serializer = new Jackson2JsonRedisSerializer<>(User.class);
        template.setDefaultSerializer(serializer);
        return template;
    }
}
