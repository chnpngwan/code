package com.example.cinema.service.impl;

import com.example.cinema.service.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

@Service
public class RedisServiceImpl implements RedisService {
    @Autowired
    private RedisTemplate<Object, Object> redisTemplate;

    @Override
    public Boolean exists(String key) {
        return redisTemplate.hasKey(key);
    }

    @Override
    public Boolean delete(String key) {
        return redisTemplate.delete(key);
    }

    @Override
    public Object get(String key) {
        return redisTemplate.opsForValue().get(key);
    }

    @Override
    public void incr(String key) {
        redisTemplate.opsForValue().increment(key);
    }

    @Override
    public void set(String key, Object value, long time) {
        redisTemplate.opsForValue().set(key, value, time, TimeUnit.SECONDS);
    }

    @Override
    public void sAdd(String key, Object value) {
        redisTemplate.opsForSet().add(key, value);
    }

    @Override
    public Long sRem(String key, Object value) {
        return redisTemplate.opsForSet().remove(key, value);
    }

    @Override
    public void zAdd(String key, Double score, Object value) {
        redisTemplate.opsForZSet().add(key, value, score);
    }

    @Override
    public void zIncr(String key, Double score, Object value) {
        redisTemplate.opsForZSet().incrementScore(key, value, score);
    }

    @Override
    public List<Object> zReverseRange(String key, long start, long end) {
        return new ArrayList<>(Objects.requireNonNull(redisTemplate.opsForZSet().reverseRange(key, start, end)));
    }

    @Override
    public void hSet(String key, String hashKey, Object value) {
        redisTemplate.opsForHash().put(key, hashKey, value);
    }

    @Override
    public void hIncr(String key, String hashKey, Long delta) {
        redisTemplate.opsForHash().increment(key, hashKey, delta);
    }

    @Override
    public Object hGet(String key, String hashKey) {
        return redisTemplate.opsForHash().get(key, hashKey);
    }

    @Override
    public Boolean hExists(String key, String hashKey) {
        return redisTemplate.opsForHash().hasKey(key, hashKey);
    }

    @Override
    public Long incrExpire(String key, long time) {
        Long count = redisTemplate.opsForValue().increment(key, 1);
        if (count != null && count == 1) {
            redisTemplate.expire(key, time, TimeUnit.SECONDS);
        }
        return count;
    }
}
