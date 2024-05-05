package com.dyuloon.entity.customEntity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class CaseDoctorPage {

    /**
     * 处方编号
     */
    private Integer prescriptionId;

    /**
     * 挂号单编号
     */
    private Integer registerId;

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
     * 诊断结果
     */
    private String prescriptionDiagnosis;

    /**
     * 处方时间
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime prescriptionTime;
}
