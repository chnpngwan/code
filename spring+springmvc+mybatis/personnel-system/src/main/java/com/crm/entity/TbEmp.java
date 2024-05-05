package com.crm.entity;

/**
 * ProjectName:   ssm
 * PackageName:   com.crm.entity
 * ClassName:     TbEmp
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 24 10 28
 **/
public class TbEmp {
    private Integer empId;

    private String empName;

    private String empPosition;

    private String empInDate;

    private Float empSalary;

    private Integer deptId;

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getEmpPosition() {
        return empPosition;
    }

    public void setEmpPosition(String empPosition) {
        this.empPosition = empPosition == null ? null : empPosition.trim();
    }

    public String getEmpInDate() {
        return empInDate;
    }

    public void setEmpInDate(String empInDate) {
        this.empInDate = empInDate;
    }

    public Float getEmpSalary() {
        return empSalary;
    }

    public void setEmpSalary(Float empSalary) {
        this.empSalary = empSalary;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }
}
