package com.img.controller;

import com.img.model.Upload;
import com.img.service.UploadService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.img.controller
 * ClassName:     UploadController
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 11 19 53
 **/

@Controller
public class UploadController {
    @Autowired
    private UploadService uploadService;

    //展示列表
    @RequestMapping("/show")
    public String showTeacherInfo(Model model) {
        List<Upload> uploadList = uploadService.selectAll();
        model.addAttribute("uploadList", uploadList);
        return "main";
    }

    //跳转添加界面
    @RequestMapping("/insert")
    public String insert() {
        return "insert";
    }

    //实现添加
    @RequestMapping("/uploadInsert")
    public String uploadInsert(Upload upload, MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws IOException {
        //1.获取文件信息：原始文件名
        String fileName = file.getOriginalFilename();
        //2.定义一个字节数组
        byte[] bytes = file.getBytes();
        //3.设置文件上传路径
        String filePath = request.getSession().getServletContext().getRealPath("/")+"images\\"+fileName;
        //4.开始上传
        File files = new File(filePath);
        FileUtils.writeByteArrayToFile(files,bytes);
        //5.设置图片路径
        String imgPath = "images/"+fileName;
        upload.setImgPath(imgPath);
        //6.调用添加方法
        int result = uploadService.insertUpload(upload);
        //7.判断
        if (result > 0) {
            return "redirect:/show.do";
        }
        return null;
    }
}
