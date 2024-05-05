package com.test.model;

import java.util.Date;

/**
 * ProjectName:   ssm
 * PackageName:   com.test.model
 * ClassName:     Good
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 24 15 31
 **/


public class Good {
    private int id;
    private String card_no;
    private String name;
    private int sex;
    private Date birthday;
    private String grade;
    private int integral;
    private Date write_time;

    public Good(int id, String card_no, String name, int sex, Date birth, String grade, int integral, Date write_time) {
    }

    public Good(String card_no, String name, int sex, Date birth, String grade, int integral, Date write_time) {
    }

    @Override
    public String toString() {
        return "Good{" +
                "id=" + id +
                ", card_no='" + card_no + '\'' +
                ", name='" + name + '\'' +
                ", sex=" + sex +
                ", birthday=" + birthday +
                ", grade='" + grade + '\'' +
                ", integral=" + integral +
                ", write_time=" + write_time +
                '}';
    }

    public Good() {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCard_no() {
        return card_no;
    }

    public void setCard_no(String card_no) {
        this.card_no = card_no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public int getIntegral() {
        return integral;
    }

    public void setIntegral(int integral) {
        this.integral = integral;
    }

    public Date getWrite_time() {
        return write_time;
    }

    public void setWrite_time(Date write_time) {
        this.write_time = write_time;
    }
}
