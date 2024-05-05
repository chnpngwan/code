package cn.web;

import cn.pojo.Customer;
import cn.pojo.Staff;
import cn.service.CustomerService;
import cn.service.StaffService;
import cn.service.impl.CustomerServiceImpl;
import cn.service.impl.StaffServiceImpl;
import cn.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/client/staffServlet")
public class StaffServlet extends BaseServlet{

    private StaffService staffService = new StaffServiceImpl();


    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Staff staff = WebUtils.copyParamToBean(req.getParameterMap(), new Staff());
        staffService.addStaff(staff);
        resp.sendRedirect(req.getContextPath() + "/client/staffServlet?action=list");
    }

    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getParameter("id"));
        int cid = WebUtils.parseInt(req.getParameter("id"),0);
//        2、调用StaffService.deleteStaff();删除
        staffService.deleteStaffById(cid);
        resp.sendRedirect(req.getContextPath() + "/client/staffServlet?action=list");
    }
    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Staff staff = WebUtils.copyParamToBean(req.getParameterMap(), new Staff());
        staffService.updateStaff(staff);
        resp.sendRedirect(req.getContextPath() + "/client/staffServlet?action=list");
    }
    protected void getStaff(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int sid = WebUtils.parseInt(req.getParameter("id"),0);
        Staff staff = staffService.queryStaffById(sid);
        req.setAttribute("staffs",staff);
        req.getRequestDispatcher("/page/edit/staff_edit.jsp").forward(req,resp);
    }

    protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Staff> staffs = staffService.queryStaffs();

        req.setAttribute("staffs",staffs);

        req.getRequestDispatcher("/page/client/staff.jsp").forward(req,resp);
    }
}
