package cn.web;

import cn.dao.PackageDao;
import cn.pojo.Customer;
import cn.pojo.Package;
import cn.pojo.SpecialPackage;
import cn.pojo.Waybill;
import cn.service.CustomerService;
import cn.service.impl.CustomerServiceImpl;
import cn.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/client/customerServlet")
public class CustomerServlet extends BaseServlet{

    private CustomerService customerService = new CustomerServiceImpl();



    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Customer customer = WebUtils.copyParamToBean(req.getParameterMap(), new Customer());
        customerService.addCustomer(customer);
        resp.sendRedirect(req.getContextPath() + "/client/customerServlet?action=list");
    }

    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getParameter("id"));
        int cid = WebUtils.parseInt(req.getParameter("id"),0);
//        2、调用CustomerService.deleteCustomer();删除
        customerService.deleteCustomerById(cid);
        resp.sendRedirect(req.getContextPath() + "/client/customerServlet?action=list");
    }


    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Customer customer = WebUtils.copyParamToBean(req.getParameterMap(), new Customer());
        customerService.updateCustomer(customer);
        resp.sendRedirect(req.getContextPath() + "/client/customerServlet?action=list");
    }


    protected void getCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int cid = WebUtils.parseInt(req.getParameter("id"),0);
        Customer customer = customerService.queryCustomerById(cid);
        req.setAttribute("customers",customer);
        req.getRequestDispatcher("/page/edit/customer_edit.jsp").forward(req,resp);
    }

    protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Customer> customers = customerService.queryCustomers();

        req.setAttribute("customers",customers);

        req.getRequestDispatcher("/page/client/customer.jsp").forward(req,resp);
    }
}
