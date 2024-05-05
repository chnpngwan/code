package com.learn.mybatis.controller;

import com.learn.mybatis.model.Student;
import com.learn.mybatis.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * ProjectName:   spring boot
 * PackageName:   com.learn.mybatis.controller
 * ClassName:     StudentController
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 25 19 28
 **/

@Controller
public class StudentController {

    @Resource
    private StudentService studentService;

    @RequestMapping("/show")
    public String showStudent(Model model,String name, String age){
        List<Student> students= studentService.queryAll(name, age);
        model.addAttribute("students", students);
        return "show";
    }

    @RequestMapping("/delete")
    public String delete(Model model,int id){
        int row = studentService.deleteById(id);
        if (row >0){
            model.addAttribute("success", "删除成功");
            return "redirect:/show";
        }else {
            model.addAttribute("error", "删除失败");
            return "error";
        }
    }

    @RequestMapping("/insert")
    public String insert(){
        return "insert";
    }

    @RequestMapping("/insertDo")
    public String insertDo(Model model,Student student){
        int row = studentService.insert(student);
        if (row >0){
            model.addAttribute("success", "添加成功");
            return "redirect:/show";
        }else {
            model.addAttribute("error", "添加失败");
            return "error";
        }
    }

    @RequestMapping("/deleteAll")
     public String deleteAll(int[] ids,Model model) {
        for (int id:ids) {
            studentService.deleteById(id);
        }
         return "redirect:/show";
    }

    @RequestMapping("findById")
    public String findById(Model model,int id){
        Student student = studentService.queryAllById(id);
        model.addAttribute("student",student);
        return "update";
    }

    @RequestMapping("update")
    public String updateById(Model model,Student student){
        int row = studentService.updateById(student);
        if (row >0){
            model.addAttribute("success", "修改成功");
            return "redirect:/show";
        }else {
            model.addAttribute("error", "修改失败");
            return "error";
        }
    }
}
