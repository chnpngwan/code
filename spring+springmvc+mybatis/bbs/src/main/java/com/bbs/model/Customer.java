package com.bbs.model;

/**
 * ProjectName:   ssm
 * PackageName:   com.bbs.model
 * ClassName:     customer
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 06 10 13
 **/

public class Customer {
    private int cid;
    private String account;
    private String nickName;
    private String password;
    private String tel;
    private int code;
    private int level;

    public Customer() {
        super();
    }

    @Override
    public String toString() {
        return "Customer{" +
                "cid=" + cid +
                ", account='" + account + '\'' +
                ", nickName='" + nickName + '\'' +
                ", password='" + password + '\'' +
                ", tel='" + tel + '\'' +
                ", code=" + code +
                ", level=" + level +
                '}';
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }
}
