package com.student.controller;

import com.student.bean.Student;
import com.student.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * ProjectName:  spring boot
 * PackageName:  com.student.controller
 * ClassName:    StudentController
 *
 * @Author chnpngwng
 * @Date 2023 06 12 15 48
 **/

@Controller
public class StudentController {
    @Resource
    private StudentService studentService;

    @RequestMapping("/show")
    public String showStudent(Model model,String studentName){
        List<Student> studentList = studentService.queryByName(studentName);
        model.addAttribute("studentList",studentList);
        return "index";
    }

    @RequestMapping("/delete")
    public String delete(Model model,int id){
        int result = studentService.deleteById(id);
        if (result>0){
            model.addAttribute("success","删除成功！");
            return "redirect:/show";
        }else {
            model.addAttribute("error","删除失败！");
            return "error";
        }
    }


    @RequestMapping("/insert")
    public String insert(){
        return "insert";
    }

    @RequestMapping("/doInsert")
    public String doInsert(Model model,Student student){
        int result = studentService.insert(student);
        if (result>0){
            model.addAttribute("success","添加成功！");
            return "redirect:/show";
        }else {
            model.addAttribute("error","添加失败！");
            return "redirect:/insert";
        }
    }
}
