package com.dyuloon.entity.customEntity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class CasePatientPage {

    /**
     * 处方编号
     */
    private Integer prescriptionId;

    /**
     * 挂号单编号
     */
    private Integer registerId;

    /**
     * 科室名
     */
    private String departmentName;

    /**
     * 医生电话
     */
    private String doctorTel;

    /**
     * 医生姓名
     */
    private String doctorName;

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
