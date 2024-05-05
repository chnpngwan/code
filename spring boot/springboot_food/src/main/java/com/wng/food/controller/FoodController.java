package com.wng.food.controller;

import com.wng.food.entity.Food;
import com.wng.food.service.FoodService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

/**
 * ProjectName:  spring boot
 * PackageName:  com.wng.food.controller
 * ClassName:    FoodController
 *
 * @Author chnpngwng
 * @Date 2023 06 07 10 29
 **/

@Controller
public class FoodController {
    @Resource
    private FoodService foodService;

    @RequestMapping("food")
    public String food(Model model, String name,String type){
        List<Food> foodList = foodService.queryFoods(name,type);
        model.addAttribute("foodList",foodList);
        return "index";
    }

    @RequestMapping("delete")
    public String delete(Model model, int id){
        int row = foodService.deleteById(id);
        if (row>0){
            model.addAttribute("success","删除成功");
            return "redirect:/food";
        }else {
            model.addAttribute("error","删除失败");
            return "error";
        }
    }

    @RequestMapping("insert")
    public String insert(){
        return "insert";
    }
    @RequestMapping("insertDo")
    public String insertDo(Model model, Food food){
        int row = foodService.insert(food);
        if (row>0){
            model.addAttribute("success","成功");
            return "redirect:/food";
        }else {
            model.addAttribute("error","失败");
            return "error";
        }
    }

}
