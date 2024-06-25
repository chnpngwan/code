package com.medical.controller;

import com.medical.dto.RespResult;
import com.medical.entity.User;
import com.medical.utils.Assert;
import com.medical.utils.OssUtil;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * @apiNote 
 * @author XUEW
 */
@RestController
@RequestMapping("/file")
public class FileController extends BaseController<User> {

    /**
     * 上传文件
     */
    @PostMapping("/upload")
    public RespResult upload(@RequestParam("file") MultipartFile file) throws IOException {
        String url = OssUtil.upload(file, loginUser.getId()+"");
        if (Assert.isEmpty(url)) {
            return RespResult.fail("上传失败", url);
        }
        return RespResult.success("上传成功", url);
    }

}
