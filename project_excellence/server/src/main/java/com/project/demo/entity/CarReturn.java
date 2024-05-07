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
 *汽车归还：(CarReturn)表实体类
 *
 */
@TableName("`car_return`")
@Data
@EqualsAndHashCode(callSuper = false)
public class CarReturn implements Serializable {

    //CarReturn编号
    @TableId(value = "car_return_id", type = IdType.AUTO)
    private Integer car_return_id;
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
    // 还车状态
    @TableField(value = "`return_status`")
    private String return_status;
    // 备注
    @TableField(value = "`remarks`")
    private String remarks;
    // 审核状态
    @TableField(value = "examine_state")
    private String examine_state;
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
