package com.bank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

	@RequestMapping("/login")
	public String userLogin(@RequestParam("userId")String username,
			@RequestParam("password")String password,Model model) {
		
		return null;
	}
	

}
