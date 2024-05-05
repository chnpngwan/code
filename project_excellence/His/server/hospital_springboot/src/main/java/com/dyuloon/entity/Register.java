package com.dyuloon.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import java.math.BigDecimal;
import java.time.LocalDateTime;
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
public class Register implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 挂号编号
     */
    @TableId(value = "register_id", type = IdType.AUTO)
    private Integer registerId;

    /**
     * 病人编号
     */
    private Integer patientId;

    /**
     * 医生编号
     */
    private Integer doctorId;

    /**
     * 完成状态（0：未完成，1：完成）
     */
    private Integer completionStatus;

    /**
     * 处方状态（0：未开具，1：已开具）
     */
    private Integer prescriptionStatus;

    /**
     * 挂号费用
     */
    private BigDecimal registerCost;

    /**
     * 挂号时间
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime registerDate;

    /**
     * 创建时间
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

}
