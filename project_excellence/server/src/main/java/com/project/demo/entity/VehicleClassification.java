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
 *汽车分类：(VehicleClassification)表实体类
 *
 */
@TableName("`vehicle_classification`")
@Data
@EqualsAndHashCode(callSuper = false)
public class VehicleClassification implements Serializable {

    //VehicleClassification编号
    @TableId(value = "vehicle_classification_id", type = IdType.AUTO)
    private Integer vehicle_classification_id;
    // 汽车类型
    @TableField(value = "`car_type`")
    private String car_type;


    // 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;

}
