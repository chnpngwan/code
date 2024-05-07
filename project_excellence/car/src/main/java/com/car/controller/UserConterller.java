package com.car.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.car.model.User;
import com.car.service.UserService;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserConterller {
	
	@Resource
	public UserService userService;
	
	/*
	 * //全表查询
	 * 
	 * @RequestMapping("selectAllUser") public String selectAllBook(Model model) {
	 * List<User> userList = userService.selectAllUser();
	 * model.addAttribute("userList", userList); return "index"; }
	 */
	
	
	//登录查询验证
	@RequestMapping("LoginDao")
	public String usernameAndPassword(User user, Model model, HttpServletRequest request) {
		//验证用户名和密码是否正确
		User user_temp = userService.usernameAndPassword(user);
		String Message ="";
		if(user_temp != null) {
			//正确，将用户信息保存到Session中，跳转到主页
			if("0".equals(user_temp.getTelephone())) {
				 Message ="当前账号被禁用！";
				 model.addAttribute("Message", Message);
				 return "Login";
			}else {
				 HttpSession session=request.getSession();
				 session.setAttribute("user", user_temp);
				 return "index";	
			}
		
		}else {
			Message="用户名或者密码错误！";
			model.addAttribute("Message", Message);
			return "Login";
		}	
	}
	
	//注销
	@RequestMapping("LogOut")
	public String LogOut(User user,Model model,HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.setAttribute("user", null);
		return "Login";
		
	}
	
	//注册
	@RequestMapping("InsertUser")
	public String InsertUser(User user,Model model) {
		int i = userService.insertUser(user);
		if(i>0) {
			return "Login";
		}
		return null;
	}
}
