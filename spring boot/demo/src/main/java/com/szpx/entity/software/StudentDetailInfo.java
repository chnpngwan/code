package com.szpx.entity.software;

import lombok.Data;


/**
 * 学生详细信息实体类
 */
@Data
public class StudentDetailInfo {

    private long stuId;

    private Integer stuNumber;

    private Integer groupNumber;

    private String stuIdNumber;

    private String classGrade;

    private String className;

    private String stuName;

    private String leaderName;

    private String projectName;

    private Double basicScore;

    private String projectUrl;
}
