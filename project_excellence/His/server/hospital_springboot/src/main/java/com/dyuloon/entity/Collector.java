package com.dyuloon.entity;

import java.time.LocalDateTime;
import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
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
public class Collector implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 收费单编号
     */
    @TableId(value = "collector_id", type = IdType.AUTO)
    private Integer collectorId;

    /**
     * 缴费编号
     */
    private String collectorNo;

    /**
     * 支付凭证
     */
    private String tradeNo;

    /**
     * 缴费患者
     */
    private String patientId;

    /**
     * 收费类型
     */
    private Integer prescriptionType;

    /**
     * 收费金额
     */
    private String chargeMoney;

    /**
     * 收费时间
     */
    @JsonFormat(shape= JsonFormat.Shape.STRING,pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private LocalDateTime chargeTime;


}
