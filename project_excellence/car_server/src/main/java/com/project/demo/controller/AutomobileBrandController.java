package com.project.demo.controller;

import com.project.demo.entity.AutomobileBrand;
import com.project.demo.service.AutomobileBrandService;
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
 *汽车品牌：(AutomobileBrand)表控制层
 *
 */
@RestController
@RequestMapping("/automobile_brand")
public class AutomobileBrandController extends BaseController<AutomobileBrand,AutomobileBrandService> {

    /**
     *汽车品牌对象
     */
    @Autowired
    public AutomobileBrandController(AutomobileBrandService service) {
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
