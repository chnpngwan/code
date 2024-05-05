package com.szpx.entity.software;

import lombok.Data;

@Data
public class StuProjectBasicInfo {

    private int projectId;

    private long stuId;

    private String classGrade;

    private String className;

    private String projectUrl;

    private String stuName;

    private String leaderName;

    private String projectName;

    private Double basicScore;
}
