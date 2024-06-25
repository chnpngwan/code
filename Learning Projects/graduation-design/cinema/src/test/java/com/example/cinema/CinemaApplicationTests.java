package com.example.cinema;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.example.cinema.entity.Hall;
import com.example.cinema.entity.Lamination;
import com.example.cinema.mapper.HallMapper;
import com.example.cinema.mapper.LaminationMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@SpringBootTest
class CinemaApplicationTests {

    @Autowired
    private JavaMailSender javaMailSender;
    @Test
    void contextLoads() {
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        //设置发送人
        simpleMailMessage.setFrom("1363343919@qq.com");
        //邮件主题
        simpleMailMessage.setSubject("这是一封测试邮件");
        //邮件内容
        simpleMailMessage.setText("好好在家待着.....");
        //收件人
        simpleMailMessage.setTo("1363343919@qq.com");
        javaMailSender.send(simpleMailMessage);
    }

}
