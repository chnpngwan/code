package com.ssm.model;

/**
 * ProjectName:   ssm
 * PackageName:   com.ssm.model
 * ClassName:     Account
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 14 15 34
 **/
public class Account {
    private int id;
    private String name;
    private double money;

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", money=" + money +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }
}
