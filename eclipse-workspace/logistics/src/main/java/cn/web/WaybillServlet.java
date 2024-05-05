package cn.web;

import cn.pojo.SpecialPackage;
import cn.pojo.Vehicle;
import cn.pojo.Waybill;
import cn.service.VehicleService;
import cn.service.WaybillService;
import cn.service.impl.VehicleServiceImpl;
import cn.service.impl.WaybillServiceImpl;
import cn.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/client/waybillServlet")
public class WaybillServlet extends BaseServlet{

    private WaybillService waybillService = new WaybillServiceImpl();


    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Waybill waybill = WebUtils.copyParamToBean(req.getParameterMap(), new Waybill());
        waybillService.addWaybill(waybill);
        resp.sendRedirect(req.getContextPath() + "/client/waybillServlet?action=list");
    }

    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getParameter("id"));
        int cid = WebUtils.parseInt(req.getParameter("id"),0);
//        2、调用WaybillService.deleteWaybill();删除
        waybillService.deleteWaybillById(cid);
        resp.sendRedirect(req.getContextPath() + "/client/waybillServlet?action=list");
    }


    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Waybill waybill = WebUtils.copyParamToBean(req.getParameterMap(), new Waybill());
        waybillService.updateWaybill(waybill);
        resp.sendRedirect(req.getContextPath() + "/client/waybillServlet?action=list");
    }


    protected void getWaybill(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int wid = WebUtils.parseInt(req.getParameter("id"),0);
        Waybill waybill = waybillService.queryWaybillById(wid);
        req.setAttribute("waybills",waybill);
        req.getRequestDispatcher("/page/edit/waybill_edit.jsp").forward(req,resp);
    }

    protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Waybill> waybills = waybillService.queryWaybills();

        req.setAttribute("waybills", waybills);

        req.getRequestDispatcher("/page/client/waybill.jsp").forward(req, resp);
    }
}
