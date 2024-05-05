package com.crm.entity;

import java.util.Date;

/**
 * ProjectName:   ssm
 * PackageName:   com.crm.entity
 * ClassName:     Tb_emp_dept
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 24 10 27
 **/
public class Tb_emp_dept {
    private Integer empId;

    private String empName;

    private String empPosition;

    private Date empInDate;

    private Float empSalary;

    private Integer deptId;
    private String deptName;

    private String deptAddress;

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
        this.empName = empName;
    }

    public String getEmpPosition() {
        return empPosition;
    }

    public void setEmpPosition(String empPosition) {
        this.empPosition = empPosition;
    }

    public Date getEmpInDate() {
        return empInDate;
    }

    public void setEmpInDate(Date empInDate) {
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

    public Tb_emp_dept(Integer empId, String empName, String empPosition, Date empInDate, Float empSalary,
                       Integer deptId, String deptName, String deptAddress) {
        super();
        this.empId = empId;
        this.empName = empName;
        this.empPosition = empPosition;
        this.empInDate = empInDate;
        this.empSalary = empSalary;
        this.deptId = deptId;
        this.deptName = deptName;
        this.deptAddress = deptAddress;
    }

    public Tb_emp_dept() {
        super();
    }

    @Override
    public String toString() {
        return "Tb_emp_dept [empId=" + empId + ", empName=" + empName + ", empPosition=" + empPosition + ", empInDate="
                + empInDate + ", empSalary=" + empSalary + ", deptId=" + deptId + ", deptName=" + deptName
                + ", deptAddress=" + deptAddress + "]";
    }

}
