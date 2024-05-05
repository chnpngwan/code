package com.wng.cache.bean;

import lombok.Data;

/**
 * ProjectName:  spring boot
 * PackageName:  com.wng.cache.bean
 * ClassName:    Emp
 *
 * @Author chnpngwng
 * @Date 2023 06 01 18 54
 **/

@Data
public class Emp {
    private int empId;
    private String empName;
    private String empAge;
    private String empSex;
    private int empSalary;

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

    public String getEmpAge() {
        return empAge;
    }

    public void setEmpAge(String empAge) {
        this.empAge = empAge;
    }

    public String getEmpSex() {
        return empSex;
    }

    public void setEmpSex(String empSex) {
        this.empSex = empSex;
    }

    public int getEmpSalary() {
        return empSalary;
    }

    public void setEmpSalary(int empSalary) {
        this.empSalary = empSalary;
    }

    public Emp(int empId, String empName, String empAge, String empSex, int empSalary) {
        this.empId = empId;
        this.empName = empName;
        this.empAge = empAge;
        this.empSex = empSex;
        this.empSalary = empSalary;
    }

}
