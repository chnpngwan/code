package com.wng.login.comtroller;

import com.sun.javafx.collections.MappingChange;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.thymeleaf.util.StringUtils;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class LoginController {
    @PostMapping("/user/login")
    public String login(@RequestParam("username") String username, @RequestParam("password") String password, Map<String,Object> map, HttpSession session){
        if (StringUtils.isEmpty(username)&&"123456".equals(password)){
            //登录成功
            session.setAttribute("loginUser",username);
            return "redirect:/main.html";
        }else {
            //登录失败
            map.put("msg","用户名或密码错误");
            return "login";
        }
    }
}
