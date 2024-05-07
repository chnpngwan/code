package com.bjsxt.controller;

import com.bjsxt.pojo.BusRents;
import com.bjsxt.pojo.Page;
import com.bjsxt.service.BusRentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("BusRentsController")
public class BusRentsController {

    @Autowired
    BusRentsService busRentsService;

    @RequestMapping("addOneCar")
    @ResponseBody
    public int addOneCar(BusRents busRents) throws Exception {
        int i = busRentsService.addOne(busRents);
        return i;
    }


    //汽车出租单多条件查询
    @RequestMapping("findMoreCars")
    @ResponseBody
    public Page<BusRents> findMoreCars(BusRents busRents){
        Page<BusRents> rentsPage = busRentsService.findMore(busRents);
        return rentsPage;
    }

    //查找出租单号
    @RequestMapping("findOneBusRents")
    @ResponseBody
    public BusRents findOneBusRents(BusRents busRents){
        return busRentsService.findOneBusRents(busRents);
    }
}
