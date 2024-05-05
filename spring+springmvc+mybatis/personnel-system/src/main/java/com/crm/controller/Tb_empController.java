package com.crm.controller;

import com.crm.entity.TbEmp;
import com.crm.entity.Tb_emp_dept;
import com.crm.service.Tb_empService;
import com.crm.service.impl.Tb_empServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.crm.controller
 * ClassName:     Tb_empController
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 24 10 34
 **/
@Controller
public class Tb_empController {
    @Resource
    private Tb_empServiceImpl service;
    @RequestMapping("selectAll")
    public String selectAll(Model model, Tb_emp_dept tb_emp_dept) {
        if (tb_emp_dept.getEmpName()==null) {
            tb_emp_dept.setEmpName("");
        }
        if (tb_emp_dept.getEmpPosition()==null) {
            tb_emp_dept.setEmpPosition("");
        }
        List<Tb_emp_dept> list=service.selectAll(tb_emp_dept);
        model.addAttribute("empList", list);
        return "/account";
    }
    @RequestMapping("addPage")
    public String addPage() {
        return "/addAccount";
    }
    @RequestMapping("add")
    public String add(TbEmp tbEmp) {
        int rows=service.add(tbEmp);
        return "redirect:selectAll.do";
    }
    @RequestMapping("delete")
    public String  delete(int id) {
        int row=service.delete(id);
        return "redirect:selectAll.do";
    }
}
