package com.szpx.entity.software;

import java.io.Serializable;

import lombok.Data;

/**
 * 考勤记录分数表
 * attendance_records_score
 */
@Data
public class AttendanceRecordsScore {
    private Integer id;

    private Double oneScore;

    private Double twoScore;

    private Double threeSroce;

    private Double fourScore;

    private Double fiveScore;

    // 小计
    private Double subtotal;

    //考勤成绩
    private Double attendanceScores;

    private long stuId;
}