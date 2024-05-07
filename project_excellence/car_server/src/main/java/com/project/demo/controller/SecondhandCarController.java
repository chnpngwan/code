package com.project.demo.controller;

import com.project.demo.entity.SecondhandCar;
import com.project.demo.service.SecondhandCarService;
import com.project.demo.controller.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 *二手汽车：(SecondhandCar)表控制层
 *
 */
@RestController
@RequestMapping("/secondhand_car")
public class SecondhandCarController extends BaseController<SecondhandCar,SecondhandCarService> {

    /**
     *二手汽车对象
     */
    @Autowired
    public SecondhandCarController(SecondhandCarService service) {
        setService(service);
    }

    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        this.addMap(paramMap);
        return success(1);
    }

}
