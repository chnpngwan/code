package com.personnel.model;

import java.util.Date;

/**
 * ProjectName:   ssm
 * PackageName:   com.personnel.model
 * ClassName:     Emp
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 23 18 30
 **/
public class Emp {
    private int empId;
    private String empName;
    private String empPosition;
    private Date empInDate;
    private float empSalary;
    private int deptId;
    private Dept dept;

    public Emp() {
        super();
    }

    @Override
    public String toString() {
        return "Emp{" +
                "empId=" + empId +
                ", empName='" + empName + '\'' +
                ", empPosition='" + empPosition + '\'' +
                ", empInDate=" + empInDate +
                ", empSalary=" + empSalary +
                ", deptId=" + deptId +
                ", dept=" + dept +
                '}';
    }

    public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
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

    public float getEmpSalary() {
        return empSalary;
    }

    public void setEmpSalary(float empSalary) {
        this.empSalary = empSalary;
    }

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }
}
