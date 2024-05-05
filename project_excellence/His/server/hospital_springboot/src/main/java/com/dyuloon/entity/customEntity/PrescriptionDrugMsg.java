package com.dyuloon.entity.customEntity;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Data
public class PrescriptionDrugMsg {

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
     * 诊断结果
     */
    private String prescriptionDiagnosis;

    /**
     * 处方时间
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime prescriptionTime;

    /**
     * 二级列表（一个一级列表有多个二级列表）
     */
    private List<PrescriptionDrugObj> children = new ArrayList<>();
}
