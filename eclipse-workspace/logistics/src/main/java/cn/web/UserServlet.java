package cn.web;

import cn.pojo.User;
import cn.service.UserService;
import cn.service.impl.UserServiceImpl;
import cn.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/userServlet")
public class UserServlet extends BaseServlet{
    private UserService userService = new UserServiceImpl();

    /**
     * 登录处理业务
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取请求的参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        req.setAttribute("msg","");
        //调用userService.login()登录处理业务
        User loginUser = userService.login(new User(0,username,password));
        if(loginUser == null){
            req.setAttribute("username",username);
            //弹窗提醒登录失败
            req.setAttribute("msg","用户名或密码错误!!");
            req.getRequestDispatcher("page/user/login.jsp").forward(req, resp);
        } else {
            req.setAttribute("msg","");
            req.getRequestDispatcher("client/packageServlet?action=list").forward(req, resp);
        }
    }

    /**
     * 注册请求业务
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    public void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取请求的参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String rePassword = req.getParameter("repwd");

        User user = WebUtils.copyParamToBean(req.getParameterMap(),new User());
        if (userService.existsUsername(username)){
            req.setAttribute("username",username);
            req.setAttribute("msg","用户名已存在!!");
            System.out.println("用户名[" + username + "]已存在！");
            req.getRequestDispatcher("page/user/regist.jsp").forward(req,resp);
        }else if (!rePassword.equals(password)){
            req.setAttribute("username",username);
            req.setAttribute("msg","密码不一致!!");
            System.out.println("密码：" + password + " 与 " + rePassword + "不一致!");
            req.getRequestDispatcher("page/user/regist.jsp").forward(req,resp);
        }else {
            userService.registUser(new User(0,username,password));
            req.getRequestDispatcher("page/user/login.jsp").forward(req,resp);
        }
    }



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

}
