package com.szpx.controller.software;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import com.szpx.entity.software.StuProjectBasicInfo;
import com.szpx.service.software.ProjectService;
import com.szpx.utils.aesutils.EncryptionUtil;
import com.szpx.utils.jsonutils.ApiResult;
import com.szpx.utils.pageutils.PageUtil;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
public class ProjectController {

    @Resource
    private ProjectService projectService;

    @PostMapping("/ltj/getBasicProjectInfo")
    public ApiResult getAllUsr(@RequestParam(value = "pageNum") Integer pageNum) throws Exception {
        PageUtil pageUtil = new PageUtil();
        pageUtil.setPageNum(pageNum);
        PageInfo<StuProjectBasicInfo> basicProjectInfo = projectService.getBasicProjectInfo(pageUtil);
        String encryptData = EncryptionUtil.encryptData(JSONArray.toJSONString(basicProjectInfo));
        return ApiResult.success(encryptData);
    }

    @GetMapping("/ltj/test")
    public ApiResult apiResult(){
        return ApiResult.success(projectService.getAllProjectTaskByStuId(2));
    }

}
