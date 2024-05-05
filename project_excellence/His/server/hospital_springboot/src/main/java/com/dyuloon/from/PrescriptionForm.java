package com.dyuloon.from;

import com.dyuloon.entity.PrescriptionDrug;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class PrescriptionForm {

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
     * 二级列表（一个一级列表有多个二级列表）
     */
    private List<PrescriptionDrug> children = new ArrayList<>();
}
