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
 *保险管理：(InsuranceManagement)表实体类
 *
 */
@TableName("`insurance_management`")
@Data
@EqualsAndHashCode(callSuper = false)
public class InsuranceManagement implements Serializable {

    //InsuranceManagement编号
    @TableId(value = "insurance_management_id", type = IdType.AUTO)
    private Integer insurance_management_id;
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
    // 汽车年份
    @TableField(value = "`car_year`")
    private String car_year;
    // 保险类型
    @TableField(value = "`insurance_type`")
    private String insurance_type;
    // 保险公司
    @TableField(value = "`insurance_company`")
    private String insurance_company;
    // 购买保险日期
    @TableField(value = "`date_of_purchase`")
    private Timestamp date_of_purchase;
    // 保险到期日期
    @TableField(value = "`insurance_expiration_date`")
    private Timestamp insurance_expiration_date;


    // 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;

}
