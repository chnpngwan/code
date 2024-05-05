package com.wng.cache.controller;

import com.wng.cache.bean.Emp;
import com.wng.cache.service.EmpService;
import com.wng.cache.service.impl.EmpServiceImpl;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * ProjectName:  spring boot
 * PackageName:  com.wng.cache.controller
 * ClassName:    EmpController
 *
 * @Author chnpngwng
 * @Date 2023 06 01 19 06
 **/

@RestController
public class EmpController {
    @Resource
    private EmpServiceImpl empService;

    @GetMapping("/emp/{empId}")
    public String mobile(@PathVariable("empId") Integer empId){
        Emp emp = empService.empById(empId);
        return emp.toString();
    }

    @GetMapping("/emp")
    public String employee(Emp emp){
       empService.update(emp);
        return emp.toString();
    }
    @GetMapping("/deleteEmp")
    public String deleteEmp(Integer empId){
        empService.delete(empId);
        return "清除缓存！";
    }
}
