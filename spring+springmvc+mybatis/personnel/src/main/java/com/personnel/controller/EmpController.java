package com.personnel.controller;

import com.personnel.model.Emp;
import com.personnel.service.EmpService;
import com.personnel.service.impl.EmpServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.personnel.controller
 * ClassName:     EmpController
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 23 19 02
 **/
@Controller
public class EmpController {
    @Resource
    private EmpServiceImpl empService;
    @RequestMapping("/list")
    public String getList(Model model,String empPosition, String empName) {
        List<Emp> lsi = empService.select(empPosition, empName);
        System.out.println(lsi);
        model.addAttribute("list",lsi);
        return "list";
    }

    @RequestMapping("/delete")
    public String delete(Model model,int empId) {
        int rows = empService.deleteById(empId);
        if (rows > 0) {
            model.addAttribute("success","数据删除成功");
            return "redirect:/list.do";
        }else {
            model.addAttribute("error","数据删除失败");
            return "forward:/error.do";
        }
    }


    @RequestMapping("/insert")
    public String insert() {
        return "insert";
    }

    @RequestMapping("/insertDo")
    public String insertdo(Model model,Emp emp) {
        int rows = empService.insert(emp);
        if (rows > 0) {
            model.addAttribute("success","数据添加成功");
            return "redirect:/list.do";
        }else {
            model.addAttribute("error","数据添加失败");
            return "forward:/error.do";
        }
    }
}
