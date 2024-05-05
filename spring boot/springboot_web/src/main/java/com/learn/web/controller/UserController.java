package com.learn.web.controller;

import com.learn.web.model.Customer;
import com.learn.web.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

/**
 * ProjectName:   spring boot
 * PackageName:   com.leaarn.web.controller
 * ClassName:     UserController
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 24 10 40
 **/

@Controller
public class UserController {
    @RequestMapping("/login1")
    public String login(){
        return "login";
    }
    @RequestMapping("/loginDo")
    public String loginDo(@ModelAttribute User user, Model model){
        model.addAttribute("user",user);
        Customer customer = new Customer("zhangsan",12,"昆明","2001-02-01");
        Customer customer1 = new Customer("lisi",20,"km","2004-01-02");
        List customerList = new ArrayList<>();
        customerList.add(customer);
        customerList.add(customer1);
        model.addAttribute("customerList",customerList);
        return "show";
    }
}
