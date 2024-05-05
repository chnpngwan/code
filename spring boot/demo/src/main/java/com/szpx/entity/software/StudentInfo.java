package com.szpx.entity.software;

import java.io.Serializable;
import lombok.Data;

/**
 * 学生信息
 * student_info
 */
@Data
public class StudentInfo{
    private long stuId;

    private Integer stuNumber;

    private String stuName;

    private String projectUrl;
}