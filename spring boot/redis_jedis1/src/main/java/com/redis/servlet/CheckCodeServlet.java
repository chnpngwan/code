package com.redis.servlet;

import redis.clients.jedis.Jedis;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * ProjectName:   spring boot
 * PackageName:   com.redis.servlet
 * ClassName:     CheckCodeServlet
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 16 19 09
 **/


public class CheckCodeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取用户手机号和验证码
        String phoneNo = req.getParameter("phone_no");
        String inputCode = req.getParameter("verify_code");
        if (phoneNo==null || inputCode==null){
            return;
        }
        //拼接redis中保存验证码的Key
        String codeKey = "phoneNo:"+phoneNo+":code";
        //创建Jedis对象
        Jedis jedis = new Jedis("127.0.0.1",6379);
        //获取redis验证码
        String code = jedis.get(codeKey);
        //验证验证码的准确性
        if (inputCode.equals(code)){
            //将redis验证码删除
            jedis.del(codeKey);
            resp.getWriter().write("true");
        }
        jedis.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
