package com.dyuloon.entity.customEntity;

import lombok.Data;

@Data
public class DoctorEntity {

    /**
     * 医生编号
     */
    private Integer doctorId;

    /**
     * 科室名
     */
    private String departmentName;

    /**
     * 医生姓名
     */
    private String doctorName;

    /**
     * 医生性别
     */
    private Integer doctorSex;

    /**
     * 医生年龄
     */
    private Integer doctorAge;

    /**
     * 医生电话
     */
    private String doctorTel;

}
