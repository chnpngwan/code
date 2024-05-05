package com.house.controller;

import com.house.model.House;
import com.house.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * ProjectName:  ssm
 * PackageName:  com.house.controller
 * ClassName:    HouseController
 *
 * @Author chnpngwng
 * @Date 2023 06 19 16 05
 **/
@Controller
public class HouseController {
	//调用serviceImpl
	@Autowired
	private HouseService houseService;
	
	@RequestMapping("/show")
	public String showHouse(Model model,String location,
			Double min,
			Double max) {
		List<House> houseList=houseService.query(location,min,max);
		model.addAttribute("houseList", houseList);
		return "main";
	}
	
	
	//删除
	@RequestMapping("/deleteById")
	public String deleteById(Model model,int id) {
		int rows=houseService.deleteById(id);
		if (rows>0) {
			model.addAttribute("success", "删除成功！");
			return "redirect:/show";
		}else {
			model.addAttribute("error", "删除失败！");
			return "error";
		}
		
	}

}
