package cn.web;

import cn.pojo.Customer;
import cn.pojo.MostPackage;
import cn.service.ComplexService;
import cn.service.impl.ComplexServiceImpl;
import cn.utils.WebUtils;
import org.junit.Test;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/client/complexServlet")
public class ComplexServlet extends BaseServlet{

    private ComplexService complexService = new ComplexServiceImpl();

    protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<MostPackage> mostPackages = complexService.mostPackages();
        System.out.println(mostPackages);
        req.setAttribute("complex",mostPackages);

        req.getRequestDispatcher("/page/client/mostPackages.jsp").forward(req,resp);
    }

    protected void showCustomers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<MostPackage> mostCustomers = complexService.mostCustomers();
        System.out.println(mostCustomers);
        req.setAttribute("mostCustomers",mostCustomers);

        req.getRequestDispatcher("/page/client/mostCustomers.jsp").forward(req,resp);
    }

    protected void late(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<MostPackage> latePackages = complexService.latePackages();
        System.out.println(latePackages);
        req.setAttribute("latePackages",latePackages);

        req.getRequestDispatcher("/page/client/latePackages.jsp").forward(req,resp);
    }

    protected void search(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int wid = WebUtils.parseInt(req.getParameter("search"),0);
        MostPackage mostPackages = complexService.queryById(wid);
        System.out.println(mostPackages);
        req.setAttribute("search",mostPackages);

        req.getRequestDispatcher("/page/client/search.jsp").forward(req,resp);
    }



}
