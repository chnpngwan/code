package com.dyuloon.controller;

import cn.hutool.core.io.FileUtil;
import com.dyuloon.entity.Doctor;
import com.dyuloon.entity.Patient;
import com.dyuloon.entity.UserAdmin;
import com.dyuloon.service.DoctorService;
import com.dyuloon.service.PatientService;
import com.dyuloon.service.UserAdminService;
import com.dyuloon.util.ResultVOUtil;
import com.dyuloon.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@RestController
@RequestMapping("/file")
public class FileController {
    @Autowired
    private UserAdminService userAdminService;

    @Autowired
    private DoctorService doctorService;

    @Autowired
    private PatientService patientService;

    @Value("${ip:localhost}")
    String ip;

    @Value("${server.port}")
    String port;

    // 图片文件根目录
    private static final String ROOT_PATH = System.getProperty("user.dir") + File.separator + "files" + File.separator + "images";

    @PostMapping("/upload")
    public ResultVO upload(@RequestParam("file") MultipartFile file, @RequestHeader("userId") String userId, @RequestHeader("userIdentity") String userIdentity) throws IOException {
        String originalFilename = file.getOriginalFilename(); // 获取文件原始名称 aaa.png
        String mainName = FileUtil.mainName(originalFilename); // aaa
        String extName = FileUtil.extName(originalFilename); // png
        if (!FileUtil.exist(ROOT_PATH)) FileUtil.mkdir(ROOT_PATH); // 判断文件夹是否存在，不存在则创建
        if (FileUtil.exist(ROOT_PATH + File.separator + originalFilename)) { // 如果当前文件已经存在，则重命名
            originalFilename = System.currentTimeMillis() + "-" + mainName + "." + extName;
        }
        File saveFile = new File(ROOT_PATH + File.separator + originalFilename);
        file.transferTo(saveFile); // 存储文件到磁盘
        String relativeUrl = "/file/image/" + originalFilename;
        if (userIdentity.equals("1")) {
            UserAdmin userAdmin = this.userAdminService.getById(userId);
            userAdmin.setHeadImg(relativeUrl);
            this.userAdminService.updateById(userAdmin);
        }
        if (userIdentity.equals("2")) {
            Doctor doctor = this.doctorService.getById(userId);
            doctor.setHeadImg(relativeUrl);
            this.doctorService.updateById(doctor);
        }
        if (userIdentity.equals("3")) {
            Patient patient = this.patientService.getById(userId);
            patient.setHeadImg(relativeUrl);
            this.patientService.updateById(patient);
        }
        String url = "http://" + ip + ":" + port + relativeUrl;
        return ResultVOUtil.success(url, "上传成功！");
    }

    // 拿图片
    @GetMapping("/image/{fileName}")
    public void download(@PathVariable String fileName, HttpServletResponse response) throws IOException {
        String filePath = ROOT_PATH + File.separator + fileName;
        if (!FileUtil.exist(filePath)) {
            return;
        }
        byte[] bytes = FileUtil.readBytes(filePath);
        ServletOutputStream outputStream = response.getOutputStream();
        outputStream.write(bytes);
        outputStream.flush();
        outputStream.close();
    }

    // 恢复默认头像
    @PutMapping("/restoreDefaultAvatar")
    public ResultVO restoreDefaultAvatar(@RequestHeader("userId") String userId, @RequestHeader("userIdentity") String userIdentity) {
        if (userIdentity.equals("1")) {
            UserAdmin userAdmin = this.userAdminService.getById(userId);
            userAdmin.setHeadImg("");
            this.userAdminService.updateById(userAdmin);
        }
        if (userIdentity.equals("2")) {
            Doctor doctor = this.doctorService.getById(userId);
            doctor.setHeadImg("");
            this.doctorService.updateById(doctor);
        }
        if (userIdentity.equals("3")) {
            Patient patient = this.patientService.getById(userId);
            patient.setHeadImg("");
            this.patientService.updateById(patient);
        }
        return ResultVOUtil.success(null,"更新成功！");
    }
}
