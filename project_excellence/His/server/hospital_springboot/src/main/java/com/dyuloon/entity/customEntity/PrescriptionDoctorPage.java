package com.dyuloon.entity.customEntity;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class PrescriptionDoctorPage {

    /**
     * 挂号编号
     */
    private Integer registerId;

    /**
     * 病人id
     */
    private Integer patientId;

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
     * 病人手机号
     */
    private String patientTel;

    /**
     * 病人身份证号
     */
    private Long patientNumber;

    /**
     * 处方状态（0：未开具，1：已开具）
     */
    private Integer prescriptionStatus;

    /**
     * 挂号时间
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime registerDate;
}
