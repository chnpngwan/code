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
 * @since 2023-06-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class UserAdmin implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 管理员id
     */
    @TableId(value = "admin_id", type = IdType.AUTO)
    private Integer adminId;

    /**
     * 头像相对路径
     */
    private String headImg;

    /**
     * 管理员电话
     */
    private String adminTel;

    /**
     * 管理员密码
     */
    private String adminPassword;

    /**
     * 管理员姓名
     */
    private String adminName;

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
