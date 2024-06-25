package com.zpark.legou.utils;

import jakarta.servlet.http.HttpServletResponse;
import lombok.Data;
import org.springframework.http.MediaType;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

/**
 * 结果集工具类
 */
@Data
public class JsonResult {

    //信息
    private String msg;
    //状态码
    private Integer code;
    //状态
    private Boolean state;
    //数据
    private Map<String, Object> data;

    private JsonResult(String msg, Integer code, Boolean state, Map<String, Object> data) {
        this.msg = msg;
        this.code = code;
        this.state = state;
        this.data = data;
    }

    public JsonResult(String msg, Integer code, Boolean state) {
        this(msg, code, state, new HashMap<>());
    }
    //封装成功结果集
    public static JsonResult successful(String msg){
        return new JsonResult(msg, 200, true);
    }
    //封装失败结果集
    public static JsonResult failed(String msg){
        return new JsonResult(msg, 500, false);
    }
    //往结果集放数据
    public JsonResult add(String key, Object value){
        this.data.put(key, value);
        return this;
    }

    public void toWebClient(HttpServletResponse response){
        //响应 json
        response.setContentType(MediaType.APPLICATION_JSON_VALUE);
        // utF-8
        response.setCharacterEncoding(StandardCharsets.UTF_8.name());

        String json = JsonHelper.toJSON(this);

        try {
            response.getWriter().println(json);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }



}
