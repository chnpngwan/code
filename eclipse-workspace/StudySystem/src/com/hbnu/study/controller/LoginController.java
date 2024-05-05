package com.hbnu.study.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hbnu.study.bean.LoginDto;
import com.hbnu.study.bean.Student;
import com.hbnu.study.bean.User;
import com.hbnu.study.service.LoginService;
import com.hbnu.study.service.impl.LoginServiceImpl;

@Controller
public class LoginController {

    private LoginService loginService = new LoginServiceImpl();
    /**
     * ��¼��ѯ������ѧ��ʵ�����session
     *
     * @param
     * @param session
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(User user, HttpSession session) {
        /**
         * user����������ݱ�����������������
         */
        System.out.println(user);
        User newUser = loginService.login(user);
        if (newUser == null) {//user����Ϊ�գ����ص�¼ʧ�ܽ���
            return "LoginFaild";
        }
        session.setAttribute("user", newUser);//���user����
        if (newUser.getRole().equals("����Ա") || newUser.getRole().equals("��ʦ")) {
            return "MainPage";//���Ϊ����Ա���߽�ʦ  ����������
        }

        Student student = loginService.login2(user);
        if (student != null) {
            session.setAttribute("student", student);//���Ϊѧ��
            return "MainPage";
        } else {
            System.out.println("����Ϊ��");
        }
        return "LoginFaild";
    }

    /**
     * �˳���¼
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        if (session.getAttribute("user") != null
                && session.getAttribute("student") != null) {
            session.removeAttribute("user");
            session.removeAttribute("student");
            return "LoginPage";
        } else {
            return "LoginPage";
        }
    }
}
