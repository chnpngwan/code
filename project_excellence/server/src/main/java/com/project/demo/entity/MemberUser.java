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
 *会员用户：(MemberUser)表实体类
 *
 */
@TableName("`member_user`")
@Data
@EqualsAndHashCode(callSuper = false)
public class MemberUser implements Serializable {

    //MemberUser编号
    @TableId(value = "member_user_id", type = IdType.AUTO)
    private Integer member_user_id;
    // 用户名
    @TableField(value = "`user_name`")
    private String user_name;
    // 姓名
    @TableField(value = "`full_name`")
    private String full_name;
    // 性别
    @TableField(value = "`gender`")
    private String gender;
    // 用户编号
    @TableField(value = "user_id")
    private Integer userId;


    // 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;

}
