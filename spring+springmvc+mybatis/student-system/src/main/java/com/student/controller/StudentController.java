/**
 * @author Chnpng Wng
 * @data Apr 17, 2023
 * @time 3:42:40 PM
 */
package com.student.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.student.model.Student;
import com.student.service.impl.StudentServiceImpl;

@Controller
public class StudentController {
	@Resource
	private StudentServiceImpl studentServiceImpl;
	
	@RequestMapping("/show")
	public String show(Model model) {
		List<Student> studentList = studentServiceImpl.selectByAll();
		System.out.println(studentList);
		model.addAttribute("studentList",studentList);
		return "show";
	}
	
	@RequestMapping("/delete")
	public String delete(Model model,String id) {
		int rows = studentServiceImpl.deleteById(id);
		System.out.println(rows);
		if (rows>0) {
			model.addAttribute("success","删除数据成功！");
			return "redirect:/show.do";
		}else {
			model.addAttribute("error","删除数据失败！");
			return "forward:/error.do";
		}
	}
	
	@RequestMapping("/insert")
	public String insert(Model model) {
			return "insertStudent";
	}
	
	@RequestMapping("/insertDo")
	public String insertDo(Model model,Student student) {
		int rows = studentServiceImpl.insertInfo(student);
		if (rows>0) {
			model.addAttribute("success","添加数据成功！");
			return "redirect:/show.do";
		}else {
			model.addAttribute("error","添加数据失败！");
			return "forward:/error.do";
		}
	}
	
	@RequestMapping("/update")
	public String update(Model model,String id) {
			return "update";
	}
	
	@RequestMapping("/updateDo")
	public String update(Model model,Student student) {
		int rows = studentServiceImpl.updateStudent(student);
		System.out.println(rows);
		if (rows>0) {
			model.addAttribute("success","修改数据成功！");
			return "redirect:/show.do";
		}else {
			model.addAttribute("error","修改数据失败！");
			return "forward:/error.do";
		}
	}
}
