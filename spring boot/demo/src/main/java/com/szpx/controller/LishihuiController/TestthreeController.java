package com.szpx.controller.LishihuiController;

import com.szpx.entity.lishihui.TestThree;
import com.szpx.service.TestThreeService;
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
@RequestMapping("/th")
public class TestthreeController {
    @Autowired
    private TestThreeService testThreeService;

    /**
     * 访问FormTableAjaxIndex
     * /lsh/toHuiHui
     *
     * @param session
     * @return RequestMapping 返回一个网页
     */
    @RequestMapping("/toTestThree")
    public String toTestThree(HttpSession session, Model model) {
        List<TestThree> t3 = testThreeService.selectAllTestThree();
        System.out.println(t3.toString());
//        session.setAttribute("th",t3);
        model.addAttribute("th",t3);
//        D:\demo\src\main\resources\templates\lishihuiTeacherHtml\lishihuiAjaxHtml\TestThree.html
        return "lishihuiTeacherHtml/lishihuiAjaxHtml/TestThree";
    }


}
