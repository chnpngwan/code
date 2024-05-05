package com.dyuloon.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import java.time.LocalDateTime;
import java.io.Serializable;

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
public class Prescription implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 处方编号
     */
    @TableId(value = "prescription_id", type = IdType.AUTO)
    private Integer prescriptionId;

    /**
     * 挂号单id
     */
    private Integer registerId;

    /**
     * 医生编号
     */
    private Integer doctorId;

    /**
     * 病人编号
     */
    private Integer patientId;

    /**
     * 诊断结果
     */
    private String prescriptionDiagnosis;

    /**
     * 缴费状态
     */
    private Integer paymentStatus;

    /**
     * 处方时间
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime prescriptionTime;


}
