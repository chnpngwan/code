package com.sofftem.servlet;

import com.google.gson.Gson;
import com.sofftem.bean.User;
import com.sofftem.service.UserService;
import com.sofftem.service.impl.UserServiceImpl;
import com.sofftem.utils.BaseServlet;
import com.sofftem.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(value = "/UserServlet")
public class UserServlet extends BaseServlet {
    protected void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.invalidate();//销毁当前session对象
        Cookie emailCookie = new Cookie("email", "");
        emailCookie.setMaxAge(0);//设置0就表式立即删除
        resp.addCookie(emailCookie);//立即删除掉该Cookie
//        usernameCookie.setPath(req.getContextPath() + "/pages/user/signin.jsp");
        Cookie passwordCookie = new Cookie("password", "");
        passwordCookie.setMaxAge(0);
        resp.addCookie(passwordCookie);
//        passwordCookie.setPath(req.getContextPath() + "/pages/user/signin.jsp");
        resp.sendRedirect(req.getContextPath() + "/index.jsp");
    }

    protected void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = new User();
        WebUtils.copyParamToBean(req.getParameterMap(), user);
        System.out.println("user = " + user);
        User login = new UserServiceImpl().login(user);
        if (login == null) {
            HttpSession session = req.getSession();
            session.setAttribute("msg", "邮箱或密码输入错误!");
            session.setAttribute("email", user.getEmail());
            session.setAttribute("password", user.getPassword());
            Cookie emailCookie = new Cookie("email", "");
//            emailCookie.setPath(req.getContextPath() + "/pages/user/signin.jsp");
            emailCookie.setMaxAge(0);//设置0就表式立即删除
            resp.addCookie(emailCookie);//立即删除掉该Cookie
            Cookie passwordCookie = new Cookie("password", "");
//            passwordCookie.setPath(req.getContextPath() + "/pages/user/signin.jsp");
            passwordCookie.setMaxAge(0);
            resp.addCookie(passwordCookie);
            resp.sendRedirect(req.getContextPath() + "/pages/user/signin.jsp");
        } else {
            if (req.getParameter("remember").equals("1")) {//如果来成功执行处.我们来把用户名与密码保存到cookie中
                Cookie emailCookie = new Cookie("email", login.getEmail());
                emailCookie.setPath(req.getContextPath() + "/pages/user/signin.jsp");//只有在访问login.jsp时.才会发送cookie
                emailCookie.setMaxAge(60 * 60 * 24 * 7);//保存7天
                Cookie passwordCookie = new Cookie("password", login.getPassword());
                passwordCookie.setPath(req.getContextPath() + "/pages/user/signin.jsp");
                passwordCookie.setMaxAge(60 * 60 * 24 * 7);
                resp.addCookie(emailCookie);
                resp.addCookie(passwordCookie);
            }
//            else {
//                req.getSession().setAttribute("user", login);
//                System.out.println("login = " + login);
//                req.getRequestDispatcher("/index.jsp").forward(req, resp);//否则表示用户名密码输入正确,跳转到登录成功页
//            }
            req.getSession().setAttribute("user", login);
//            System.out.println("login = " + login);
            req.getRequestDispatcher("/index.jsp").forward(req, resp);//否则表示用户名密码输入正确,跳转到登录成功页
        }
    }

    protected void regist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = new User();
        WebUtils.copyParamToBean(req.getParameterMap(), user);
        req.setAttribute("username", user.getUsername());
        req.setAttribute("password", user.getPassword());
        req.setAttribute("email", user.getEmail());
        UserService userService = new UserServiceImpl();
        if (userService.existsEmail(user.getEmail())) {
            userService.registUser(user);
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        } else {
            req.setAttribute("msg", "该邮箱[" + user.getEmail() + "]已有账户!");
            req.getRequestDispatcher("/pages/user/signup.jsp").forward(req, resp);
        }
    }

    protected void forgotpassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=utf-8");
        String email = req.getParameter("email");
        UserService userService = new UserServiceImpl();
        User user = userService.getPassword(email);
        resp.getWriter().print(new Gson().toJson(user));
    }

    protected void updateUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        Object username = req.getAttribute("username");
//        Object email = req.getAttribute("email");
//        Object firstname = req.getAttribute("firstname");
//        Object lastname = req.getAttribute("lastname");
        User user = new User();
        WebUtils.copyParamToBean(req.getParameterMap(), user);
        System.out.println("user = " + user);
        int i = new UserServiceImpl().updateInfo(user, user.getId());
        String msg;
        if (i != 1) {
            msg = "更新失败!";
        } else msg = "更新成功.";
        req.setAttribute("msg", msg);
        req.getRequestDispatcher("/pages/pag/profile.jsp").forward(req, resp);
    }

    protected void updateUserpassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String oldpass = (String) req.getAttribute("oldpass");
        String newpass = (String) req.getAttribute("newpass");
        UserServiceImpl userService = new UserServiceImpl();
        int id = WebUtils.parseInt(req.getParameter("id"), 0);
        String password = userService.getPassword(email).getPassword();
        String msg;
        if (password.equals(oldpass)) {
            int i = userService.updatePass(newpass, id);
            if (i != 1) {
                msg = "更新失败!";
            } else msg = "更新成功.";
            req.setAttribute("msg", msg);
        } else msg = "密码不正确！";
        req.setAttribute("msg", msg);
        req.getRequestDispatcher("/pages/pag/profile.jsp").forward(req, resp);
    }
}
