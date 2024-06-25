package com.ruoyi.web.controller;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.core.domain.AjaxResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TController {


//  全局访问的接口 -- 不同登录直接访问
    @Anonymous   // 开放接口
    @GetMapping("/tt")
    public AjaxResult get(){
        AjaxResult result = new AjaxResult();
        result.put("mess","我的请求不用登录，即可直接访问");
        return  result;
    }

}
