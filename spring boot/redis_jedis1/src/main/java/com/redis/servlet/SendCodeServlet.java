package com.redis.servlet;

import redis.clients.jedis.Jedis;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Random;

/**
 * ProjectName:   spring boot
 * PackageName:   com.redis.servlet
 * ClassName:     SendCodeServlet
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 16 18 56
 **/


public class SendCodeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取手机号
        String phoneNo = req.getParameter("phone_no");
        if (phoneNo == null || "".equals(phoneNo)){
            return;
        }
        //使用redis拼接保存验证码的Key
        String codeKey = "phoneNo:"+phoneNo+":code";
        //生产6位验证码
        String code = getCode(6);
        System.out.println(code);
        //创建Jedis对象
        Jedis jedis = new Jedis("127.0.0.1",6379);
        jedis.setex(codeKey,60,code);
        resp.getWriter().write("true");
        jedis.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

    public String getCode(int len) {
        String code = "";
        for (int i =0 ;i<len;i++){
            Random random = new Random();
            int index = random.nextInt(10);
            code +=index;
        }
        return code;
    }
}
