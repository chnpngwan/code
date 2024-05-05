package com.flea.common;

import lombok.Data;

import java.util.HashMap;
import java.util.Map;

/**
 * 后端返回封装的通用结果类
 */
@Data
public class Result<T> {

    private Integer code;//编码：1成功，0失败，2用户错误操作提示，201管理员成功登录，202用户成功登录
    private String msg;//错误信息
    private T data;//数据
    private Map map = new HashMap<>();//动态数据

    public static <T> Result<T> success(T object) {
        Result<T> r = new Result<>();
        r.data = object;
        r.code = 1;
        return r;
    }

    public static <T> Result<T> success(T object, Integer code) {
        Result<T> r = new Result<>();
        r.data = object;
        r.code = code;
        return r;
    }

    public static <T> Result<T> error(String msg) {
        Result r = new Result();
        r.msg = msg;
        r.code = 0;
        return r;
    }

    public static <T> Result<T> error(String msg, Integer code){
        Result r = new Result();
        r.msg = msg;
        r.code = code;
        return r;
    }

    public Result<T> add(String key, Object value) {
        this.map.put(key, value);
        return this;
    }
}
