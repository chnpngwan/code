package com.dyuloon.entity.customEntity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class ChangeDoctorDepartmentEntity {

    /**
     * 医生编号
     */
    @TableId(value = "doctor_id", type = IdType.AUTO)
    private Integer doctorId;

    /**
     * 科室编号
     */
    private Integer departmentId;

    /**
     * 科室名
     */
    private String departmentName;

    /**
     * 医生姓名
     */
    private String doctorName;
}
