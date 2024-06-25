package com.medical.service;

import cn.hutool.http.HttpRequest;
import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson.JSONObject;
import com.medical.utils.HttpUtils;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * @author XUEW
 * @apiNote
 */
@Service
public class ApiService {

    public String query(String content) {
        String result = "";
        String host = "https://znys.market.alicloudapi.com";
        String path = "/sent.do";
        String method = "GET";
        String appcode = "f90894fb5c1442dd87bcaf8d60d710c7";
        Map<String, String> headers = new HashMap<String, String>();
        headers.put("Authorization", "APPCODE " + appcode);
        Map<String, String> querys = new HashMap<String, String>();
        querys.put("content", content);
        querys.put("product", "medical");
        querys.put("uuid", System.currentTimeMillis() + "");
        try {
            HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
            System.out.println(response.toString());
            JSONObject resp = (JSONObject) JSONObject.parse(EntityUtils.toString(response.getEntity()));
            result = (String) resp.get("msg");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return result;
        }
    }
}
