package com.dyuloon.entity.customEntity;

import lombok.Data;

@Data
public class PrescriptionDrugObj {

    /**
     * 处方药品id
     */
    private Integer medicineId;

    /**
     * 挂号单id
     */
    private Integer registerId;

    /**
     * 药品名称
     */
    private String drugsName;

    /**
     * 药物数量
     */
    private Integer medicineNum;

    /**
     * 药物备注
     */
    private String medicineNotes;
}
