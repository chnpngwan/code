package com.zpark.legou.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.json.JsonMapper;
import com.fasterxml.jackson.datatype.jdk8.Jdk8Module;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.fasterxml.jackson.module.paramnames.ParameterNamesModule;

import java.util.Objects;

public class JsonHelper {

    private JsonHelper(){
        throw new RuntimeException("no com.zpark.legou.utils.JsonHelper instance for you");
    }

    static final ObjectMapper MAPPER = new JsonMapper();

    static {
        MAPPER.registerModule(new Jdk8Module())
                .registerModule(new JavaTimeModule())
                .registerModule(new ParameterNamesModule());
    }

    //对象转 json
    public static String toJSON(Object object){
        Objects.requireNonNull(object);
        try {
            return MAPPER.writeValueAsString(object);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    //json 转对象
    public static <T> T toObject(String json, Class<T> clazz){
        Objects.requireNonNull(json);
        Objects.requireNonNull(clazz);
        try {
            return MAPPER.readValue(json, clazz);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

}
