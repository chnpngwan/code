package com.tour.controller;

import com.tour.model.Tour;
import com.tour.service.TourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;

/**
 * ProjectName:  ssm
 * PackageName:  com.tour.controller
 * ClassName:    TourController
 *
 * @Author chnpngwng
 * @Date 2023 06 19 16 05
 **/

@Controller
public class TourController {
    @Autowired
    private TourService tourService;

    @RequestMapping("/show")
    public String showStudent(Model model, String name,String sex,@RequestParam(defaultValue = "-1")int type){
        List<Tour> tourList = tourService.queryThings(name,sex,type);
        model.addAttribute("tourList",tourList);
        return "main";
    }

    @RequestMapping("/deleteById")
    public String deleteById(Model model,int id) {
        int rows=tourService.deleteById(id);
        if (rows>0) {
            model.addAttribute("success", "删除成功！");
            return"redirect:/show";
        }else {
            model.addAttribute("error", "删除失败！");
            return"error";
        }
    }

    @RequestMapping("/insert")
    public String insert() {
        return "insert";
    }

    @RequestMapping("/doInsert")
    public String doInsert(Model model,Tour tour) {
        tour.setRegisterTime(new Date());
        int rows=tourService.insertTour(tour);
        if (rows>0) {
            model.addAttribute("success", "添加成功！");
            return"redirect:/show";
        }else {
            model.addAttribute("error", "添加失败！");
            return"error";
        }
    }
}
