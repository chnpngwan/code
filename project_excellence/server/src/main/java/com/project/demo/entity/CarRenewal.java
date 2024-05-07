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
 *汽车续租：(CarRenewal)表实体类
 *
 */
@TableName("`car_renewal`")
@Data
@EqualsAndHashCode(callSuper = false)
public class CarRenewal implements Serializable {

    //CarRenewal编号
    @TableId(value = "car_renewal_id", type = IdType.AUTO)
    private Integer car_renewal_id;
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
    // 租赁价格
    @TableField(value = "`rental_price`")
    private String rental_price;
    // 租赁时长
    @TableField(value = "`lease_duration`")
    private String lease_duration;
    // 续租时长
    @TableField(value = "`renewal_duration`")
    private String renewal_duration;
    // 续租日期
    @TableField(value = "`renewal_date`")
    private Timestamp renewal_date;
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
