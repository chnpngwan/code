package com.szpx.controller.LishihuiController;

import com.szpx.entity.User;
import com.szpx.entity.lishihui.InterfaceDataResponse;
import com.szpx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * JSON工具类研究-灰灰老师组
 */
@Controller
public class InterfaceDataController {
    @Autowired
    private UserService userService;


    public InterfaceDataResponse getUsers() {
        List<User> users = userService.selectAllUser(); // 调用Mapper方法获取用户列表
        InterfaceDataResponse response = new InterfaceDataResponse();
        response.setCode(0);
        response.setMsg("");
        response.setCount(users.size()); // 设置总数，或者你可以从数据库中获取这个值
        response.setData(users); // 设置用户数据
        return response;
    }

    @RequestMapping("/lshdataTableTestOne")
    public String dataTableTestOne(HttpSession session) {
        return "lishihuiTeacherHtml/InterfaceDataHtml/dataTableTestOne";
    }


    @GetMapping("/lshjsonData")
    @ResponseBody
    public InterfaceDataResponse getAllUsers() {
        /**
         {
         "code": 0,
         "msg": "",
         "count": 1000,
         "data": [
         {
         "id": 10000,
         "username": "user-0",
         "sex": "女",
         "city": "城市-0",
         "sign": "签名-0",
         "experience": 255,
         "logins": 24,
         "words": 82830700,
         "classify": "作家",
         "score": 57
         },
         {
         "id": 10001,
         "username": "user-1",
         "sex": "男",
         "city": "城市-1",
         "sign": "签名-1",
         "experience": 884,
         "logins": 58,
         "words": 64928690,
         "classify": "词人",
         "score": 70.5,
         "editable": true
         }
         ]
         }
         */
//        List<User> users = userService.selectAllUser();
//        List<String> userList = new ArrayList<>();
//        JSONObject jsonObject = new JSONObject();
//        jsonObject.put("code", 0);
//        jsonObject.put("msg", "");
//        jsonObject.put("count", 1000);
//        jsonObject.put("data", users);
//        System.out.println(jsonObject.toString());  // 输出: {"name":"Alice","age":30,"city":"New York"}
//        String stringJsonObject = JSONArray.toJSONString(jsonObject);
        InterfaceDataResponse idr = getUsers();
        System.out.println(idr.toString());
        return idr; // 这个列表将自动转换为JSON格式  返回数据，HttpStatus默认为200 OK
    }


}
