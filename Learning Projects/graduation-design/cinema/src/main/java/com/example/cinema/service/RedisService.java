package com.example.cinema.service;

import java.util.List;

public interface RedisService {
    Boolean exists(String key);
    Boolean delete(String key);
    void set(String key, Object value, long time);
    Object get(String key);
    void incr(String key);
    void sAdd(String key, Object value);
    Long sRem(String key, Object value);
    void zAdd(String key, Double score, Object value);
    void zIncr(String key, Double score, Object value);
    List<Object> zReverseRange(String key, long start, long end);
    void hSet(String key, String hashKey, Object value);
    void hIncr(String key, String hashKey, Long delta);
    Object hGet(String key, String hashKey);
    Boolean hExists(String key, String hashKey);
    Long incrExpire(String key, long time);
}
