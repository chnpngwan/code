package com.example.cinema.vo;

import com.example.cinema.enums.StatusCodeEnum;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import static com.example.cinema.enums.StatusCodeEnum.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Response<T> {
    private Integer code;
    private String message;
    private T data;

    public static <T> Response<T> success() {
        return new Response<>(SUCCESS.getCode(), SUCCESS.getMessage(), null);
    }

    public static <T> Response<T> success(T data) {
        return new Response<>(SUCCESS.getCode(), SUCCESS.getMessage(), data);
    }

    public static <T> Response<T> failure() {
        return new Response<>(FAILURE.getCode(), FAILURE.getMessage(), null);
    }

    public static <T> Response<T> failure(String message) {
        return new Response<>(FAILURE.getCode(), message, null);
    }

    public static <T> Response<T> bindFailure(String message) {
        return new Response<>(VALID_ERROR.getCode(), message, null);
    }

    public static <T> Response<T> failure(StatusCodeEnum statusCodeEnum) {
        return new Response<>(statusCodeEnum.getCode(), statusCodeEnum.getMessage(), null);
    }
}
