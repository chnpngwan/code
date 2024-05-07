package com.project.demo.controller;

import com.project.demo.entity.LeaseContract;
import com.project.demo.service.LeaseContractService;
import com.project.demo.controller.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *租赁合同：(LeaseContract)表控制层
 *
 */
@RestController
@RequestMapping("/lease_contract")
public class LeaseContractController extends BaseController<LeaseContract,LeaseContractService> {

    /**
     *租赁合同对象
     */
    @Autowired
    public LeaseContractController(LeaseContractService service) {
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
