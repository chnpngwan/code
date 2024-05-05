package com.szpx.entity.software;

import java.io.Serializable;
import lombok.Data;

/**
 * 期末考察分数表
 * final_visit_score
 */
@Data
public class FinalVisitScore {
    private Integer id;

    private Double score;

    private Double finalVisitScore = 80.00;

    private long stuId;
}