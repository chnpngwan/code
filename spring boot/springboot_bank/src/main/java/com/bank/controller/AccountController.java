package com.bank.controller;

import com.bank.bean.Account;
import com.bank.service.AccountService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * ProjectName:  spring boot
 * PackageName:  com.bank.controller
 * ClassName:    AccountController
 *
 * @Author chnpngwng
 * @Date 2023 06 13 18 33
 **/

@Controller
public class AccountController {
    @Resource
    private AccountService accountService;

    @RequestMapping("/show")
    public String show(Model model,String NAME){
        List<Account> accountList = accountService.queryByName(NAME);
        model.addAttribute("accountList",accountList);
        return "main";
    }

    @RequestMapping("/delete")
    public String delete(Model model,int ID){
        int result = accountService.deleteById(ID);
        if (result>0){
            model.addAttribute("success","删除成功！");
            return "redirect:/show";
        }else {
            model.addAttribute("error","删除失败！");
            return "error";
        }
    }

    @RequestMapping("/insert")
    public String insert(){
        return "insert";
    }

    @RequestMapping("/doinsert")
    public String doinsert(Model model,Account account){
        int result = accountService.insertAccount(account);
        if (result>0){
            model.addAttribute("success","添加成功！");
            return "redirect:/show";
        }else {
            model.addAttribute("error","添加失败！");
            return "redirect:/insert";
        }
    }
}
