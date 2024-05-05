package com.dyuloon.entity.customEntity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class CasePatientPayPage {

    /**
     * 处方单号
     */
    private Integer prescriptionId;

    /**
     * 科室名
     */
    private String departmentName;

    /**
     * 医生姓名
     */
    private String doctorName;

    /**
     * 药物总价
     */
    private double drugsPrice;

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
