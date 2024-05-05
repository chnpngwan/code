package com.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.model.Admin;
import com.model.Car;
import com.model.Car1;
import com.model.Car3;
import com.model.Car4;
import com.model.Car5;
import com.model.CarAll;
import com.model.Client;
import com.model.Cont;
import com.model.Driver;
import com.service.CarService;

@Controller
public class CarController {
	@Resource 
	public CarService carService;
	
	//车全表查询
	@RequestMapping("selectAllCar")
	public String  selectAllCar(Model model,@RequestParam(defaultValue = "1") int page ) {
		// 设置分页：页码,每页条数
		PageHelper.startPage(page, 3); 
		List<Car> carList = carService.selectAllCar();
		PageInfo<Car> pageInfo = new PageInfo<Car>(carList,3);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("carList", carList);
		return "Carshowd";	
	}
	
	//车全表查询1
	@RequestMapping("selectAllCar1")
	public String  selectAllCar1(Model model,@RequestParam(defaultValue = "1") int page ) {
		// 设置分页：页码,每页条数
		PageHelper.startPage(page, 3); 
		List<Car1> carList = carService.selectAllCar1();
		PageInfo<Car1> pageInfo = new PageInfo<Car1>(carList,3);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("carList", carList);
		return "Carshowd";
		
	}
	//车全表查询3
		@RequestMapping("selectAllCar3")
		public String  selectAllCar3(Model model,@RequestParam(defaultValue = "1") int page ) {
		// 设置分页：页码,每页条数
		PageHelper.startPage(page, 3); 
		List<Car3> carList = carService.selectAllCar3();
		PageInfo<Car3> pageInfo = new PageInfo<Car3>(carList,3);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("carList", carList);
		return "Carshowd";
			
	}
		
		//车全表查询4
		@RequestMapping("selectAllCar4")
		public String  selectAllCar4(Model model,@RequestParam(defaultValue = "1") int page ) {
		// 设置分页：页码,每页条数
		PageHelper.startPage(page, 3); 
		List<Car4> carList = carService.selectAllCar4();
		PageInfo<Car4> pageInfo = new PageInfo<Car4>(carList,3);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("carList", carList);
		return "Carshowd";
	}
		
	//车全表查询5
	@RequestMapping("selectAllCar5")
	public String  selectAllCar5(Model model,@RequestParam(defaultValue = "1") int page ) {
	// 设置分页：页码,每页条数
	PageHelper.startPage(page, 3); 
	List<Car5> carList = carService.selectAllCar5();
	PageInfo<Car5> pageInfo = new PageInfo<Car5>(carList,3);
	model.addAttribute("pageInfo", pageInfo);
	model.addAttribute("carList", carList);
	return "Carshowd";
}

	//客户案例
	@RequestMapping("selectSllClient")
	public String  selectSllClient(Model model,@RequestParam(defaultValue = "1") int page ) {
	// 设置分页：页码,每页条数
	PageHelper.startPage(page, 3); 
	List<Client> clientList = carService.selectSllClient();
	PageInfo<Client> pageInfo = new PageInfo<Client>(clientList,3);
	model.addAttribute("pageInfo", pageInfo);
	model.addAttribute("clientList", clientList);
	return "ClientCase";
}

	//专车司机
	@RequestMapping("selectSAllDriver")
	public String  selectSAllDriver(Model model,@RequestParam(defaultValue = "1") int page ) {
	//设置分页：页码,每页条数
	PageHelper.startPage(page, 4); 
	List<Driver> drivertList = carService.selectSAllDriver();
	PageInfo<Driver> pageInfo = new PageInfo<Driver>(drivertList,4);
	model.addAttribute("pageInfo", pageInfo);
	model.addAttribute("drivertList", drivertList);
	return "Driver";
}
	
	//用户留言
	@RequestMapping("insertINtoCont")
	public String insertINtoCont(Cont cont,Model model) {
		int i = carService.insertINtoCont(cont);
		if(i>0) {
			return "ChengG";
		}
		return null;
	}
	
	
	//管理员登录查询验证
    @RequestMapping("AdminLoginDao")
	public String usernameAndPassword(Admin admin,Model model,HttpServletRequest request) {
		//验证用户名和密码是否正确
		Admin admins = (Admin) carService.selectByNameAndPwd1(admin);
		String Message ="";
		if(admins != null) {
			//正确，将用户信息保存到Session中，跳转到主页
			 HttpSession session=request.getSession();
			 session.setAttribute("admin", admins);
			 return "redirect:/selectSAllCarAll.do";		
			}else {
			Message="管理员账号或者密码错误！";
			model.addAttribute("Message", Message);
			return "Admin_Failure";
		}	
	}
		
		
		//管理员车全表查询
		@RequestMapping("selectSAllCarAll")
		public String  selectSAllCarAll(Model model,@RequestParam(defaultValue = "1") int page ) {
			// 设置分页：页码,每页条数
			PageHelper.startPage(page, 3); 
			List<CarAll> carAlltList = carService.selectSAllCarAll();
			PageInfo<CarAll> pageInfo = new PageInfo<CarAll>(carAlltList,3);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("carAlltList", carAlltList);
			return "Admin";	
		}
		
	    //管理员客户管理系统
		@RequestMapping("selectAllAdminClient")
		public String selectAllAdminClient(Model model,@RequestParam(defaultValue = "1") int page) {
			// 设置分页：页码,每页条数
			PageHelper.startPage(page, 3); 
			List<Client> clienAdmintList = carService.selectAllAdminClient();
			PageInfo<Client> pageInfo = new PageInfo<Client>(clienAdmintList,3);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("clienAdmintList", clienAdmintList);
			return "AdminClient";			
		}
		
		//管理员在线预约管理系统
		@RequestMapping("selectAllCont")
		public String selectAllCont(Model model,@RequestParam(defaultValue = "1") int page) {
			// 设置分页：页码,每页条数
			PageHelper.startPage(page, 3); 
			List<Cont> conttList = carService.selectAllCont();
			PageInfo<Cont> pageInfo = new PageInfo<Cont>(conttList,3);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("conttList", conttList);
			return "AdminCont";	
		}
		
		
		//管理员专车司机管理系统
		@RequestMapping("selectAllDriverAdmin")
		public String selectAllDriverAdmin(Model model,@RequestParam(defaultValue = "1") int page) {
			// 设置分页：页码,每页条数
			PageHelper.startPage(page, 3); 
			List<Driver> drivertAdminList = carService.selectAllDriverAdmin();
			PageInfo<Driver> pageInfo = new PageInfo<Driver>(drivertAdminList,3);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("drivertAdminList", drivertAdminList);
			return "AdminDriver";	
		}
		
		
		//管理员车辆模糊擦好像
		@RequestMapping("selectCarAllByName")
		public String selectCarAllByName(String type,Model model) {
			List<CarAll> carAlltList = carService.selectCarAllByName(type);
			model.addAttribute("carAlltList", carAlltList);
			return "Admin";
		}
		
	   //管理员根据id获取内容
		@RequestMapping("selectByIdCarall")
		public String selectByIdCarall(String id,Model model) {
			List<CarAll> carAlltList = carService.selectByIdCarall(id);
			model.addAttribute("carAlltList", carAlltList);
			return "UpdateAdminCar";
		}
		
		//管理员修改成功以后
		@RequestMapping("updateByIDCarAll")
		public String updateByIDCarAll(CarAll carall,Model model) {
			int row = carService.updateByIDCarAll(carall);
			if(row>0) {
				return "redirect:/selectSAllCarAll.do";
			}
			return null;
		}
}
