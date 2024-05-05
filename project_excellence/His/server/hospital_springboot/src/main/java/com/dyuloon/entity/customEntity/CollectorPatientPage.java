package com.dyuloon.entity.customEntity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class CollectorPatientPage {
    /**
     * 收费单编号
     */
    private Integer collectorId;

    /**
     * 支付凭证
     */
    private String tradeNo;

    /**
     * 缴费患者
     */
    private String patientName;

    /**
     * 收费类型
     */
    private Integer prescriptionType;

    /**
     * 收费金额
     */
    private String chargeMoney;

    /**
     * 收费时间
     */
    @JsonFormat(shape= JsonFormat.Shape.STRING,pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private LocalDateTime chargeTime;
}
