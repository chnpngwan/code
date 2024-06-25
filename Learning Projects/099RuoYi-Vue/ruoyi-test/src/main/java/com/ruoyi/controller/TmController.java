package com.ruoyi.controller;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.core.domain.AjaxResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

// 测试子模块开发
@RestController
public class TmController {

    @Anonymous
    @GetMapping("/tm")
    public AjaxResult get(){
        AjaxResult result = new AjaxResult();
        result.put("mess","子模块测试开发！！！");
        return  result;
    }


}
