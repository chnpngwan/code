package com.house.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.house.model.HouseInfo;
import com.house.service.HouseService;

@Controller
public class HouseController {
	//引入service
	@Autowired
	private HouseService houseService;
	
	//查询全部数据
	@RequestMapping("/show")
	public String selectHouseInfo(Model model,String location,Double min,Double max) {
		List<HouseInfo> houses = houseService.queryHouses(location, min,max);
		System.out.println(houses);
		model.addAttribute("houses", houses);
		return "main";	
	}
	
	//删除
	@RequestMapping("/deteleHouseById")
	public String deteleHouseById(Model model,int id) {
		int result = houseService.deteleHouseById(id);
		if(result>0) {
			model.addAttribute("success", "删除成功！");
			return "redirect:/show.do";
		}else {
			model.addAttribute("error", "删除失败！");
			return "error";
		}
	}
}
