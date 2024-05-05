package com.szpx.entity.software;

import java.io.Serializable;
import lombok.Data;

/**
 * 项目检查分数表
 * project_checks_score
 */
@Data
public class ProjectChecksScore {
    private Integer id;

    private Double oneScore;

    private Double twoScore;

    private Double threeSroce;

    //小计
    private Double subtotal;

    //项目考察成绩
    private Double projectChecksScore;

    private long stuId;

}