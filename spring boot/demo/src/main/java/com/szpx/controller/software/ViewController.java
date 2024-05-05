package com.szpx.controller.software;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 控制器类，负责处理视图相关的请求和逻辑。
 */
@Controller
public class ViewController {

    /**
     * 主页视图
     * @return
     */
    @GetMapping("/ltj/home")
    public String home(){
        return "litianjian/home";
    }


    /**
     * 学生详细信息视图
     * @return
     */
    @GetMapping("/ltj/stuInfoDetail")
    public String stuInfoDetail(){
        return "litianjian/stu_info_detail";
    }


    /**
     * 学生信息概况列表视图
     * @return
     */
    @GetMapping("/ltj/stuInfoList")
    public String stuInfoList(){
        return "litianjian/stu_info_list";
    }


    /**
     * 详细分数视图
     * @return
     */
    @GetMapping("/ltj/scoreDetail")
    public String scoreDetail(){
        return "litianjian/score_detail";
    }

    @GetMapping("/ltj/page404")
    public String page404(){
        return "litianjian/404";
    }

}
