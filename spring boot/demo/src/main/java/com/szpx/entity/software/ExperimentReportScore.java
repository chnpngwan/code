package com.szpx.entity.software;

import java.io.Serializable;
import lombok.Data;

/**
 * 实验报告分数表
 * experiment_report_score
 */
@Data
public class ExperimentReportScore {
    private Integer id;

    private Double oneScore;

    private Double twoScore;

    private Double threeSroce;

    private Double fourScore;

    private Double fiveScore;

    //小计
    private Double subtotal;

    //实验报告成绩
    private Double experimentReportScore;

    private long stuId;

}