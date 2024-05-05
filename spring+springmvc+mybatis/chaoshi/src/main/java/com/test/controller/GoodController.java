package com.test.controller;

import com.test.model.Good;
import com.test.service.GoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * ProjectName:   ssm
 * PackageName:   com.test.controller
 * ClassName:     GoodController
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 24 15 41
 **/

@Controller
public class GoodController {
    @Autowired
    private GoodService goodService;

    @RequestMapping("/list")
    public String list(Model model,String name) {
        List<Good> goodList=goodService.selectGoods(name);
        System.out.println(goodList);
        model.addAttribute("goodList",goodList);
        return "list";
    }

    @RequestMapping("/insert")
    public String insert() {
        return "insert";
    }
    @RequestMapping("/insertDo")
    public String insertDo(Model model,String name,int sex,String birthday) throws ParseException {
        StringBuilder stringBuilder = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 4;i++) {
            stringBuilder.append(random.nextInt(10));
        }
        String card_no = stringBuilder.toString();
        String grade = "四级";
        int integral = 200;
        Date write_time = new Date();
        SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
        Date birth = simpleDate.parse(birthday);
        Good good = new Good(card_no,name,sex,birth,grade,integral,write_time);
        System.out.println(good);
        int rows = goodService.insertGoods(good);
        if (rows > 0) {
            model.addAttribute("success","数据添加成功");
            return "redirect:/list.do";
        }else {
            model.addAttribute("errror","数据添加失败");
            return "forward:/error.do";
        }
    }

    @RequestMapping("/deleteById")
    public String delete(Model model,int id) {
        int rows = goodService.deleteGoods(id);
        if (rows > 0) {
            model.addAttribute("success","数据删除成功");
            return "redirect:/list.do";
        }else {
            model.addAttribute("error","数据删除失败");
            return "forward:/error.do";
        }
    }
}
