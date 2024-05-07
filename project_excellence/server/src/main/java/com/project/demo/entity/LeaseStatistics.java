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
 *租赁统计：(LeaseStatistics)表实体类
 *
 */
@TableName("`lease_statistics`")
@Data
@EqualsAndHashCode(callSuper = false)
public class LeaseStatistics implements Serializable {

    //LeaseStatistics编号
    @TableId(value = "lease_statistics_id", type = IdType.AUTO)
    private Integer lease_statistics_id;
    // 汽车类型
    @TableField(value = "`car_type`")
    private String car_type;
    // 租赁次数
    @TableField(value = "`number_of_leases`")
    private String number_of_leases;
    // 租赁日期
    @TableField(value = "`lease_date`")
    private Timestamp lease_date;
    // 统计人
    @TableField(value = "`statistician`")
    private String statistician;
    // 备注
    @TableField(value = "`remarks`")
    private String remarks;


    // 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;

}
