package com.dyuloon.entity.customEntity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class UpdateDoctorDepartmentEntity {

    /**
     * 医生编号
     */
    private Integer doctorId;

    /**
     * 科室编号
     */
    private Integer departmentId;
}
