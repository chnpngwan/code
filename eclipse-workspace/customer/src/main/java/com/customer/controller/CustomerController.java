/**
 * @author Chnpng Wng
 * @data Apr 19, 2023
 * @time 11:11:39 AM
 */
package com.customer.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.customer.model.Customer;
import com.customer.service.impl.CustomerServiceImpl;

@Controller
public class CustomerController {
	@Autowired
	private CustomerServiceImpl customerServiceImpl;
	
	@RequestMapping("/list")
	public String liString(Model model,Integer customerId,String customerName) {
		List<Customer> listCustomers = customerServiceImpl.selectList(customerId,customerName);
		model.addAttribute("listCustomers",listCustomers);
		return "list";
	}
	
	@RequestMapping("/insert")
	public String insert(Model model) {
		return "insert";
	}
	
	@RequestMapping("/insertDo")
	public String insertDo(Model model,Customer customer) {
		int rows = customerServiceImpl.insertCustomer(customer);
		if (rows>0) {
			model.addAttribute("success","添加数据成功！");
			return "redirect:/list.do";
		}else {
			model.addAttribute("error","添加数据失败！");
			return "forward:/error.do";
		}
	}
	
	@RequestMapping("/delete")
	public String delete(Model model,Integer customerId) {
		int rows = customerServiceImpl.deleteCustomer(customerId);
		if (rows>0) {
			model.addAttribute("success","删除数据成功！");
			return "redirect:/list.do";
		}else {
			model.addAttribute("error","删除数据失败！");
			return "forward:/error.do";
		}
	}
	
	@RequestMapping("queryCustomerById")
	public String queryCustomerById(Model model, Integer customerId) {
	 // 根据id查询客户信息
	 List<Customer> list = customerServiceImpl.queryCustomerById(customerId);
	 model.addAttribute("list", list);
	 return "update";
	}

	@RequestMapping("/updateCustomer")
	public String updateCustomer(Model model, Customer customer) {
	 // 修改操作
	 int count = customerServiceImpl.updateCustomer(customer);
	 if (count>0) {
			model.addAttribute("success","修改数据成功！");
			return "redirect:/list.do";
		}else {
			model.addAttribute("error","修改数据失败！");
			return "forward:/error.do";
		}
	}
}
