package com.project.demo.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;


/**
 *租车订单：(CarRentalOrder)表实体类
 *
 */
@TableName("`car_rental_order`")
@Data
@EqualsAndHashCode(callSuper = false)
public class CarRentalOrder implements Serializable {

    //CarRentalOrder编号
    @TableId(value = "car_rental_order_id", type = IdType.AUTO)
    private Integer car_rental_order_id;
    // 用户名
    @TableField(value = "`user_name`")
    private Integer user_name;
    // 姓名
    @TableField(value = "`full_name`")
    private String full_name;
    // 联系方式
    @TableField(value = "`contact_information`")
    private String contact_information;
    // 汽车编号
    @TableField(value = "`car_number`")
    private String car_number;
    // 汽车品牌
    @TableField(value = "`automobile_brand`")
    private String automobile_brand;
    // 汽车型号
    @TableField(value = "`car_model`")
    private String car_model;
    // 汽车类型
    @TableField(value = "`car_type`")
    private String car_type;
    // 租赁价格
    @TableField(value = "`rental_price`")
    private String rental_price;
    // 租赁时长
    @TableField(value = "`lease_duration`")
    private String lease_duration;
    // 审核状态
    @TableField(value = "examine_state")
    private String examine_state;
    // 支付状态
    @TableField(value = "pay_state")
    private String pay_state;

    // 支付类型: 微信、支付宝、网银
    @TableField(value = "pay_type")
    private String pay_type;
    // 审核回复
    @TableField(value = "examine_reply")
    private String examine_reply;


    // 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;

}
