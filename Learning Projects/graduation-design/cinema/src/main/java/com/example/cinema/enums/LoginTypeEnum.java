package com.example.cinema.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum LoginTypeEnum {
    EMAIL(1, "邮箱登录", ""),
    QQ(2, "QQ登录", "qqLoginStrategyImpl"),
    WEIBO(3, "微博登录", "weiboLoginStrategyImpl");
    private final Integer type;
    private final String desc;
    private final String strategy;
}
