package com.dyuloon.entity.customEntity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.Date;

@Data
public class RegisterDoctorPage {
    /**
     * 挂号编号
     */
    private Integer registerId;

    /**
     * 病人姓名
     */
    private String patientName;

    /**
     * 病人手机号
     */
    private String patientTel;

    /**
     * 完成状态（0：未完成，1：完成）
     */
    private Integer completionStatus;

    /**
     * 挂号时间
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime registerDate;

    /**
     * 创建时间
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;
}
