package com.controller;

import java.util.List;

import javax.annotation.Resource;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.po.Student;
import com.service.Stuservice;

@Controller
public class StuController {
@Resource
private Stuservice stuservice;
//ȫ���ѯ
@RequestMapping("index")
public String selectAllStu(Model model){
	List students = stuservice.selectAllStu();
	model.addAttribute("students",students);
	return "student";
}

//����id��ѯ
@RequestMapping("Stuid")
public String Stuid(String id,Model model) {
if(id !=null && id!="") {
	List<Student> students = stuservice.SelStudentById(id);
	model.addAttribute("students",students);
	return "student";
	}else {
		return "redirect:/index.do";
	}
}

//����idɾ��
@RequestMapping("Delid")
public String Delid(String id,Model model) {
	int i = stuservice.DelStuId(id);
	model.addAttribute(model);
	return "redirect:/index.do";
}

//����
@RequestMapping("insertStu")
public String insertStudent(Student student,Model model) {
	 stuservice.insertStudent(student);
	 return "redirect:/index.do";
}

//�޸�ʱ�ȸ���id��ѯ
@RequestMapping("selid")
public String selid(String id,Model model) {
	List<Student> students = stuservice.SelStudentById(id);
	model.addAttribute("students", students);
	return "update";
}

//�޸�
@RequestMapping("update")
public String updateStuid(Student student) {
	int i = stuservice.updateStuid(student);
	return "redirect:/index.do";
}
}

