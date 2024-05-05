package com.course.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.course.model.Course;
import com.course.service.CourseService;
import com.course.service.impl.CourseServiceImpl;

@Controller
public class CourseController {
	@Autowired
	private CourseServiceImpl courseService;
	
	//条件查询
//	@RequestMapping("/show")
//	public String show(Model model,String name,String type) {
//		List<Course> courseList = courseService.selectCourses(name, type);
//		System.out.println(courseList);
//		model.addAttribute("courseList",courseList);
//		return "show";
//	}
	@RequestMapping("/show")
	public String show(Model model) {
		List<Course> courseList = courseService.select();
		System.out.println(courseList);
		model.addAttribute("courseList",courseList);
		return "show";
	}
	//根据ID删除
	@RequestMapping("/deleteById")
	public String deleteById(Model model,String id) {
		int rows = courseService.deleteById(id);
		System.out.println(rows);
		if (rows>0) {
			model.addAttribute("success","删除数据成功！");
			return "redirect:/show.do";
		}else {
			model.addAttribute("error","删除数据失败！");
			return "forward:/error.do";
		}
	}
	//根据id查询
	@RequestMapping("/selectById")
	public String selectById(Model model,String id) {
		Course courseByIdList = courseService.selectCoursesById(id);
		System.out.println(courseByIdList);
		model.addAttribute("courseByIdList",courseByIdList);
		return "update";
	}
	//修改
	@RequestMapping("/update")
	public String update(Model model,Course course) {
		int rows = courseService.updateCourses(course);
		System.out.println(rows);
		if (rows>0) {
			model.addAttribute("success","修改数据成功！");
			return "redirect:/show.do";
		}else {
			model.addAttribute("error","修改数据失败！");
			return "forward:/error.do";
		}
	}
	//添加
	@RequestMapping("/insert")
	public String insert(Model model) {
			return "insert";
	}
	
	@RequestMapping("/insertDo")
	public String insertDo(Model model,Course course) {
		int rows = courseService.insertInfo(course);
		if (rows>0) {
			model.addAttribute("success","添加数据成功！");
			return "redirect:/show.do";
		}else {
			model.addAttribute("error","添加数据失败！");
			return "forward:/error.do";
		}
	}
}
