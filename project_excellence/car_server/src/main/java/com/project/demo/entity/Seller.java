package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 *卖家：(Seller)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "Seller")
public class Seller implements Serializable {

    //Seller编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "seller_id")
    private Integer seller_id;
    // 卖家编号
    @Basic
    private String seller_number;
    // 卖家姓名
    @Basic
    private String seller_name;
    // 家庭地址
    @Basic
    private String home_address;
    // 用户编号
    @Id
    @Column(name = "user_id")
    private Integer userId;

    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}