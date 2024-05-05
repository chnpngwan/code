package com.personnel.model;

/**
 * ProjectName:   ssm
 * PackageName:   com.personnel.model
 * ClassName:     Dept
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 23 18 30
 **/
public class Dept {
    private int deptId;
    private String deptName;
    private String deptAddress;

    public Dept() {
        super();
    }

    @Override
    public String toString() {
        return "Dept{" +
                "deptId=" + deptId +
                ", deptName='" + deptName + '\'' +
                ", deptAddress='" + deptAddress + '\'' +
                '}';
    }

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getDeptAddress() {
        return deptAddress;
    }

    public void setDeptAddress(String deptAddress) {
        this.deptAddress = deptAddress;
    }
}
