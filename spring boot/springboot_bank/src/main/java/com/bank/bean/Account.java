package com.bank.bean;

import lombok.Data;
import org.springframework.stereotype.Component;

/**
 * ProjectName:  spring boot
 * PackageName:  com.bank.bean
 * ClassName:    Account
 *
 * @Author chnpngwng
 * @Date 2023 06 13 18 18
 **/

@Component
@Data
public class Account {
    private int ID;
    private String NUMBER;
    private String NAME;
    private double MONEY;

    public Account() {
    }

    public Account(int ID, String NUMBER, String NAME, double MONEY) {
        this.ID = ID;
        this.NUMBER = NUMBER;
        this.NAME = NAME;
        this.MONEY = MONEY;
    }
}
