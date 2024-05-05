package com.ynnz.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynnz.dao.StudentDao;
import com.ynnz.model.Student;
import com.ynnz.service.StudentServiceImpl;
@Controller
public class StudentController {
   
	@Resource
	private StudentDao stuStudentDao;
	
	@RequestMapping("/show")
	public String queryStudentInfo(Model model) {
		List<Student> stuList=stuStudentDao.selectStudent();
		System.out.println(stuList);
		model.addAttribute("allStu",stuList);
		return "main";
		
	}
	@RequestMapping("/delById")
	 public String deleteById(Model model,String id) {
		int result=stuStudentDao.deleteStuById(id);
		if (result>0) {
			model.addAttribute("success","数据删除成功");
		} else {
           model.addAttribute("error","数据删除失败");
		}
		return "error";
		
	}
	@RequestMapping("/gotoAdd")
	  public String gotoAddStu() {
		return "addStu";
		
	}
	//添加
	@RequestMapping("/doAdd")
	 public String doAddStudent(Model model,Student student) {
		int result=stuStudentDao.addStudentInfo(student);
		if (result>0) {
			model.addAttribute("success", "学生信息提交成功");
			return "redirect:/show";
		} else {
			model.addAttribute("eror","学生信息添加失败");
			return "forward:/error";
		}
	}
}
