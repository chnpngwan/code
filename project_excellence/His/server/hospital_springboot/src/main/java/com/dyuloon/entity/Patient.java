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
public class Patient implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 病人编号
     */
    @TableId(value = "patient_id", type = IdType.AUTO)
    private Integer patientId;

    /**
     * 头像相对路径
     */
    private String headImg;

    /**
     * 病人姓名
     */
    private String patientName;

    /**
     * 病人性别
     */
    private Integer patientSex;

    /**
     * 病人年龄
     */
    private Integer patientAge;

    /**
     * 病人身份证号
     */
    private Long patientNumber;

    /**
     * 病人手机号
     */
    private String patientTel;

    /**
     * 病人密码
     */
    private String patientPassword;

    /**
     * 权限
     */
    private Integer userIdentity;

    /**
     * 创建时间
     */
    @JsonFormat(shape= JsonFormat.Shape.STRING,pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date createTime;

    /**
     * 更新时间
     */
    @JsonFormat(shape= JsonFormat.Shape.STRING,pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date updateTime;


}
