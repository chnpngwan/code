package com.bjsxt.controller;

import com.bjsxt.pojo.BusChecks;
import com.bjsxt.service.BusChecksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("BusChecksController")
public class BusChecksController {

    @Autowired
    BusChecksService busChecksService;

    @RequestMapping("addBusCheck")
    @ResponseBody
    public int addBusCheck(BusChecks busChecks,String carnumber) throws Exception {
        return busChecksService.addBusCheck(busChecks,carnumber);
    }
}
