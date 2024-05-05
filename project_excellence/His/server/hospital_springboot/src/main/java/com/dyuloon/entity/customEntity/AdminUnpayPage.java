package com.dyuloon.entity.customEntity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class AdminUnpayPage {

    /**
     * 处方编号
     */
    private Integer prescriptionId;

    /**
     * 科室编号
     */
    private String departmentName;

    /**
     * 医生姓名
     */
    private String doctorName;

    /**
     * 病人姓名
     */
    private String patientName;

    /**
     * 病人手机号
     */
    private String patientTel;

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
