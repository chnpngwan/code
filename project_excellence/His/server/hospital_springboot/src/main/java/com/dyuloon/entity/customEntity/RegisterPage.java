package com.dyuloon.entity.customEntity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;

@Data
public class RegisterPage {

    /**
     * 挂号编号
     */
    private Integer registerId;

    /**
     * 科室名
     */
    private String departmentName;

    /**
     * 医生姓名
     */
    private String doctorName;

    /**
     * 挂号费用
     */
    private BigDecimal registerCost;

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
