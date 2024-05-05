package com.crm.entity;

/**
 * ProjectName:   ssm
 * PackageName:   com.crm.entity
 * ClassName:     TbDept
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 24 10 28
 **/
public class TbDept {
    private Integer deptId;

    private String deptName;

    private String deptAddress;

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }

    public String getDeptAddress() {
        return deptAddress;
    }

    public void setDeptAddress(String deptAddress) {
        this.deptAddress = deptAddress == null ? null : deptAddress.trim();
    }
}
