package com.ssm.controller;

import com.ssm.model.Account;
import com.ssm.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;


/**
 * ProjectName:   ssm
 * PackageName:   com.ssm.controller
 * ClassName:     AccountController
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 14 15 44
 **/
@Controller
public class AccountController {

    @Autowired
    private AccountService accountServiceImpl;

    @RequestMapping("/save")
    @ResponseBody
    public String save(Account account) throws IOException {
        accountServiceImpl.save(account);
        return "save success";
    }

    @RequestMapping("/findAll")
    public ModelAndView findAll() throws IOException {
        System.out.println("1");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("accountList");
        modelAndView.addObject("accountList",accountServiceImpl.findAll());
        return modelAndView;
    }

    @RequestMapping("/list")
    public String list(){
        System.out.println(123);
        return "list";
    }
}
