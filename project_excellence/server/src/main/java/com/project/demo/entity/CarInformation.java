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
 *汽车信息：(CarInformation)表实体类
 *
 */
@TableName("`car_information`")
@Data
@EqualsAndHashCode(callSuper = false)
public class CarInformation implements Serializable {

    //CarInformation编号
    @TableId(value = "car_information_id", type = IdType.AUTO)
    private Integer car_information_id;
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
    // 汽车图片
    @TableField(value = "`car_pictures`")
    private String car_pictures;
    // 租赁价格
    @TableField(value = "`rental_price`")
    private String rental_price;
    // 汽车介绍
    @TableField(value = "`car_introduction`")
    private String car_introduction;
    // 点击数
    @TableField(value = "hits")
    private Integer hits;
    // 点赞数
    @TableField(value = "praise_len")
    private Integer praise_len;


    // 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;

}
