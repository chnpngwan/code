package com.flea.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 订单表
 */
@Data
public class Orders implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long id;

    /**
     * 商品名称
     */
    private String commodityName;

    /**
     * 商品id
     */
    private Long commodityId;

    /**
     * 卖家id
     */
    private Long sellerId;

    /**
     * 买家id
     */
    private Long buyerId;

    /**
     * 状态 0：待发货，1：待收货，2：已收货
     */
    private Integer status;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)//插入时填充字段
    private LocalDateTime createTime;

    /**
     * 修改时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)//插入和更新时填充字段
    private LocalDateTime updateTime;

    /**
     * 创建人
     */
    @TableField(fill = FieldFill.INSERT)
    private Long createUser;

    /**
     * 修改人
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Long updateUser;
}
