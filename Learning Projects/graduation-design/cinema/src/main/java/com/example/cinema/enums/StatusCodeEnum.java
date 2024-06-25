package com.example.cinema.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum StatusCodeEnum {
    SUCCESS(200, "操作成功"),
    NO_LOGIN(401, "用户未登录"),
    NO_AUTHORIZED(403, "没有操作权限"),
    FAILURE(500, "操作失败"),
    VALID_ERROR(502, "参数格式不正确")
    ;
    private final Integer code;
    private final String message;
}
