package com.szpx.controller.software;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.szpx.entity.software.ProjectTask;
import com.szpx.entity.software.StudentDetailInfo;
import com.szpx.entity.software.StudentInfo;
import com.szpx.service.software.ProjectService;
import com.szpx.service.software.StudentService;
import com.szpx.utils.aesutils.EncryptionUtil;
import com.szpx.utils.jsonutils.ApiResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
public class StudentController {

    @Resource
    StudentService studentService;

    @Resource
    ProjectService projectService;


    @PostMapping("/ltj/getStudentInfoById")
    public ApiResult getStudentInfoById(long id) throws Exception {
        StudentInfo studentInfoById = studentService.getStudentInfoById(id);
        String encryptData = EncryptionUtil.encryptData(JSONArray.toJSONString(studentInfoById));
        return ApiResult.success(encryptData);
    }


    @PostMapping("/ltj/getStudentDetailInfoByStudentId")
    public ApiResult getStudentDetailInfoByStudentId(long stuId) throws Exception {
        JSONObject objectMap = new JSONObject();
        StudentDetailInfo studentDetailInfoByStudentId = studentService.getStudentDetailInfoByStudentId(stuId);
        List<ProjectTask> allProjectTaskByStuId = projectService.getAllProjectTaskByStuId(stuId);

        objectMap.put("allData",JSONArray.toJSONString(studentDetailInfoByStudentId));
        objectMap.put("allTask",JSONArray.toJSONString(allProjectTaskByStuId));

        String encryptData = EncryptionUtil.encryptData(objectMap);

        return ApiResult.success(encryptData);
    }


    @PostMapping("/ltj/stuUpdateProjectUrl")
    public ApiResult stuUpdateProjectUrl(String url,long stuId){

        studentService.stuUpdateProjectUrl(url, stuId);

        return ApiResult.success("ok");
    }


    @PostMapping("/ltj/getStudentUrlById")
    public ApiResult getStudentUrlById(long stuId){

        StudentInfo studentUrlById = studentService.getStudentUrlById(stuId);

        if (studentUrlById.getProjectUrl().equals("")){
            return ApiResult.success("null");
        }else {
            return ApiResult.success(studentUrlById.getProjectUrl());
        }
    }


}
