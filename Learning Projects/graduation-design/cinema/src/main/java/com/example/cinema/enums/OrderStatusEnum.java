package com.example.cinema.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum OrderStatusEnum {
    UNPAID(0, "未支付"),
    PAID(1, "已支付"),
    CLOSED(2, "超时已关闭")
    ;
    private final Integer code;
    private final String message;
}
