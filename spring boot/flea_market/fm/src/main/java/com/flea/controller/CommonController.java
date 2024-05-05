package com.flea.controller;

import com.flea.common.Result;
import com.flea.service.CommodityService;
import com.flea.service.OrderService;
import com.flea.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.UUID;

/**
 * 文件上传与下载（图片）
 */
@RequestMapping("/common")
@Slf4j
@RestController
public class CommonController {

    @Value("${flea-market.path}")
    private String basePath;

    @Autowired
    private UserService userService;
    @Autowired
    private CommodityService commodityService;
    @Autowired
    private OrderService orderService;

    /**
     * 文件上传
     * @param file
     * @return
     */
    @PostMapping("/upload")
    public Result<String> upload(MultipartFile file){
        log.info("上传文件：{}", file.toString());

        String originalFileName = file.getOriginalFilename();
        String suffix = originalFileName.substring(originalFileName.lastIndexOf('.'));

        String fileName = UUID.randomUUID().toString() + suffix;

        //目录不存在时创建
        File dir = new File(basePath);
        if (!dir.exists())
            dir.mkdirs();

        //转存
        try{
            file.transferTo(new File(basePath + fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return Result.success(fileName);
    }

    /**
     * 文件下载
     * @param name
     * @param response
     */
    @GetMapping("/download")
    public void download( String name, HttpServletResponse response){
        try{
            //输入流读取文件内容
            FileInputStream fileInputStream = new FileInputStream(new File(basePath + name));
            //输出流将文件写回浏览器
            ServletOutputStream outputStream = response.getOutputStream();

            response.setContentType("image/jpeg");

            int len = 0;
            byte[] bytes = new byte[1024];
            while ((len = fileInputStream.read(bytes)) != -1){
                outputStream.write(bytes, 0, len);
                outputStream.flush();
            }

            fileInputStream.close();
            outputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 查询系统用户数
     * @return
     */
    @GetMapping("/countUser")
    public Result<Integer> countUser(){
        return Result.success(userService.count());
    }

    /**
     * 查询系统商品数
     * @return
     */
    @GetMapping("/countCommodity")
    public Result<Integer> countCommodity(){
        return Result.success(commodityService.count());
    }

    /**
     * 查询系统交易数
     * @return
     */
    @GetMapping("/countOrders")
    public Result<Integer> countOrders(){
        return Result.success(orderService.count());
    }
}
