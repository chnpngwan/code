package com.student.controller;

import com.student.model.Student;
import com.student.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.student.controller
 * ClassName:     StudentController
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 25 18 16
 **/

@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    @RequestMapping("/show")
    public String show(Model model,String name){
        List<Student> studentList = studentService.selectStudent(name);
        System.out.println(studentList);
        model.addAttribute("studentList",studentList);
        return "show";
    }

    @RequestMapping("/insert")
    public String insert(){
        return "insert";
    }

    @RequestMapping("/insertDo")
    public String insertDo(Model model,Student student){
        int rows = studentService.insert(student);
        if (rows > 0) {
            model.addAttribute("success","数据添加成功！");
            return "redirect:/show.do";
        }else {
            model.addAttribute("error","数据添加失败！");
            return "forward:/error.do";
        }
    }

    @RequestMapping("/delete")
    public String delete(Model model,int id){
        int rows = studentService.delete(id);
        if (rows > 0) {
            model.addAttribute("success","数据删除成功！");
            return "redirect:/show.do";
        }else {
            model.addAttribute("error","数据删除失败！");
            return "forward:/error.do";
        }
    }
}
