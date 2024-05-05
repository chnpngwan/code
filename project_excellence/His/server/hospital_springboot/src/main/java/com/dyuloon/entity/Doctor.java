package com.dyuloon.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 *
 * </p>
 *
 * @author dyuloon
 * @since 2023-06-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Doctor implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 医生编号
     */
    @TableId(value = "doctor_id", type = IdType.AUTO)
    private Integer doctorId;

    /**
     * 头像相对路径
     */
    private String headImg;

    /**
     * 科室编号
     */
    private Integer departmentId;

    /**
     * 医生姓名
     */
    private String doctorName;

    /**
     * 医生性别
     */
    private Integer doctorSex;

    /**
     * 医生年龄
     */
    private Integer doctorAge;

    /**
     * 医生电话
     */
    private String doctorTel;

    /**
     * 医生密码
     */
    private String doctorPassword;

    /**
     * 权限
     */
    private Integer userIdentity;

    /**
     * 创建时间
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    /**
     * 更新时间
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;


}
