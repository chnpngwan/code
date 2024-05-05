package com.demo.course.controller;

import com.demo.course.entity.Course;
import com.demo.course.service.CourseService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * ProjectName:  spring boot
 * PackageName:  com.demo.course.controller
 * ClassName:    CourseController
 *
 * @Author chnpngwng
 * @Date 2023 06 09 09 04
 **/

@Controller
public class CourseController {

    @Resource
    private CourseService courseService;

    @RequestMapping("/show")
    public String show(Model model,String name,String type){
        List<Course> courseList = courseService.queryCourse(name,type);
        model.addAttribute("courseList",courseList);
        return "index";
    }

    @RequestMapping("/delete")
    public String delete(Model model,String id){
        int row = courseService.deleteCourse(id);
        if (row>0){
            model.addAttribute("success","删除成功");
            return "redirect:/show";
        }else {
            model.addAttribute("error","删除失败");
            return "error";
        }
    }

    @RequestMapping("/insert")
    public String insert(){
            return "insert";
    }

    @RequestMapping("/insertTo")
    public String insertTo(Model model,Course course){
        int row = courseService.insertCourse(course);
        if (row>0){
            model.addAttribute("success","添加成功");
            return "redirect:/show";
        }else {
            model.addAttribute("error","添加失败");
            return "error";
        }
    }
}
