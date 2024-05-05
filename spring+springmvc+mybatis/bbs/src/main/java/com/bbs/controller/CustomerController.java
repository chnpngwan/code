package com.bbs.controller;

import com.bbs.model.Customer;
import com.bbs.service.CustomerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.bbs.controller
 * ClassName:     CustomerController
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 06 10 28
 **/

@Controller
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    //登录
    @RequestMapping("/login")
    public String customerLogin(Model model,HttpSession session,String account,String password) {
        System.out.println(account+password);
        //调用方法
        Customer customer = customerService.customersLogin(account,password);
        //判断是否登录成功
        if (customer == null) {
            model.addAttribute("errmsg", "登录失败!");
            return "redirect:/login.jsp";
        }else {
            session.setAttribute("customer", customer);
            model.addAttribute("customer", customer);
            return "show";
        }
    }

    @RequestMapping("/showCust")
    public String showCustomer(Model model, @RequestParam(defaultValue = "1") int page, String account, String tel){
        PageHelper.startPage(page, 5);
        List<Customer> selectedCustomerList = customerService.selectByAccount(account,tel);
        PageInfo<Customer> pageInfo = new PageInfo<>(selectedCustomerList,3);
        model.addAttribute("selectedCustomerList",selectedCustomerList);
        model.addAttribute("pageInfo",pageInfo);
        return "showCust";
    }

    @RequestMapping("/deleteById")
    public String deleteById(Model model,int cid){
        int result = customerService.delete(cid);
        if (result > 0){
            model.addAttribute("success","数据删除成功！");
            return "forward:/showCust.do";
        }else {
            model.addAttribute("error","数据删除失败！");
            return "error";
        }
    }

    @RequestMapping("/insert")
    public String insert(Model model, Customer customer, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int result = customerService.insert(customer);
        if (result > 0) {
            model.addAttribute("success", "注册成功！");
            return "forward:/login.do";
        }else {
            model.addAttribute("error", "注册失败！");
            request.getRequestDispatcher("register.jsp").forward(request,response);
            return null;
        }
    }

    @RequestMapping("/selectById")
    public String selectById(Model model,int cid){
            Customer customer = customerService.customerById(cid);
            System.out.println(customer);
            model.addAttribute("customer",customer);
            return "updateCust";
    }

    @RequestMapping("/update")
    public String update(Model model,Customer customer){
        int result = customerService.update(customer);
        if (result > 0){
            model.addAttribute("success","数据修改成功！");
            return "forward:/showCust.do";
        }else {
            model.addAttribute("error","数据修改失败！");
            return "error";
        }
    }

    @RequestMapping("/showInfo")
    public String showInfo(Model model,HttpSession session){
        Object customerObject = session.getAttribute("customer");
        model.addAttribute("customerObject",customerObject);
        return "myInfo";
    }

    @RequestMapping("/sginOut")
    public void sginOut(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException {
        session.invalidate();
        response.sendRedirect("login.jsp");
    }
}
