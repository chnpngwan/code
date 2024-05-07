package com.bjsxt.controller;

import com.bjsxt.pojo.BusCars;
import com.bjsxt.pojo.Page;
import com.bjsxt.service.BusCarsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("BusCarsController")
public class BusCarsController {

    @Autowired
    BusCarsService busCarsService;

    @RequestMapping("findAll")
    @ResponseBody
    public Page<BusCars> findAll(int page,int rows){
        Page<BusCars> list = busCarsService.findAll(page, rows);
        return list;
    }

    @RequestMapping("addCars")
    @ResponseBody
    public int addCars(BusCars busCars){
        return busCarsService.addCars(busCars);
    }

    //文件上传
    @RequestMapping("fileUpload")
    @ResponseBody
    public Map<String,String> fileUpload(HttpServletRequest req,MultipartFile fil){

        Map<String,String> map = new HashMap<>();
        try {
            //获取服务器地址
            String realPath = req.getServletContext().getRealPath("/img");

            File file = new File(realPath);
            //判断文件是否存在,不存在新建一个
            if(!file.exists()){
                file.mkdirs();
            }

            //获取文件名
            String substring = fil.getOriginalFilename().substring(fil.getOriginalFilename().lastIndexOf("."));
            String uuid = UUID.randomUUID().toString();
            String filename = uuid+substring;

            fil.transferTo(new File(realPath,filename));

            map.put("success",filename);
        } catch (IOException e) {
            e.printStackTrace();
            map.put("error","上传失败！");
        }
            return map;
    }

    //更改车辆信息
    @RequestMapping("changeCars")
    @ResponseBody
    public int changeCars(BusCars busCars){
        return busCarsService.changeCars(busCars);
    }

    //删除一条信息
    @RequestMapping("removeCar")
    @ResponseBody
    public int removeCar(String carnumber){
        return busCarsService.remove(carnumber);
    }

    //查询可以出租的车
    @RequestMapping("findIsRenting")
    @ResponseBody
    public List<BusCars> findIsRenting(){
        return busCarsService.findIsRenting();
    }

    //查询车辆信息
    @RequestMapping("findOneCar")
    @ResponseBody
    public BusCars findOneCar(String carnumber){
        BusCars busCars = busCarsService.findOne(carnumber);
        return busCars;
    }
}
