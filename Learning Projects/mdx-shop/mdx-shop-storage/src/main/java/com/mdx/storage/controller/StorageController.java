package com.mdx.storage.controller;

import com.mdx.common.base.CommonResponse;
import com.mdx.storage.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author : jiagang
 * @date : Created in 2022/7/1 18:42
 */
@RestController
@RequestMapping("/storage")
public class StorageController {

    @Autowired
    private StorageService service;

    @GetMapping("/deduct")
    public CommonResponse deduct(String commodityCode, int count){
        service.deduct(commodityCode, count);
        return CommonResponse.success();
    }
}
