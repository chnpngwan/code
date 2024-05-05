package com.szpx.controller.LishihuiController;

import com.szpx.entity.lishihui.Huihui;
import com.szpx.service.HuihuiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 1.测试前端使用Ajax向后台发送JSON数据，后台接收到数据。
 * 2.后台使用JSON解析前端传过来的数据后返回JSON数据给前端展示。
 */
@Controller
@RequestMapping("/lsh")
public class HuihuiController {
    @Autowired
    private HuihuiService huihuiService;

    /**
     * 访问FormTableAjaxIndex
     * /lsh/toHuiHui
     *
     * @param session
     * @return RequestMapping 返回一个网页
     */
    @RequestMapping("/toHuiHui")
    public String toHuiHui(HttpSession session, Model model) {
        List<Huihui> huihuiList = huihuiService.selectAllHuihui();
        System.out.println(huihuiList.toString());
        model.addAttribute("h",huihuiList);
//        D:\demo\src\main\resources\templates\lishihuiTeacherHtml\lishihuiAjaxHtml\huihui.html
        return "lishihuiTeacherHtml/lishihuiAjaxHtml/huihui";
    }


}
