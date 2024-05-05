package com.szpx.controller.software;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.szpx.service.software.ScoreService;
import com.szpx.utils.aesutils.EncryptionUtil;
import com.szpx.utils.jsonutils.ApiResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
public class ScoreController {
    @Resource
    ScoreService scoreService;

    @PostMapping("/ltj/getScoreInfoByStuId")
    public ApiResult getScoreInfoByStuId(long stuId) throws Exception {
        System.out.println(stuId);
        JSONObject jsonObject = scoreService.showAllScore(stuId);
        String encryptData = EncryptionUtil.encryptData(JSONArray.toJSONString(jsonObject));
        return ApiResult.success(encryptData);
    }
}
