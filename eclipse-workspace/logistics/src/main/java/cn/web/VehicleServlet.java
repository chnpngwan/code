package cn.web;

import cn.pojo.Customer;
import cn.pojo.Staff;
import cn.pojo.Vehicle;
import cn.service.StaffService;
import cn.service.VehicleService;
import cn.service.impl.StaffServiceImpl;
import cn.service.impl.VehicleServiceImpl;
import cn.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/client/vehicleServlet")
public class VehicleServlet extends BaseServlet{

    private VehicleService vehicleService = new VehicleServiceImpl();



    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Vehicle vehicle = WebUtils.copyParamToBean(req.getParameterMap(), new Vehicle());
        vehicleService.addVehicle(vehicle);
        resp.sendRedirect(req.getContextPath() + "/client/vehicleServlet?action=list");
    }

    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getParameter("id"));
        int cid = WebUtils.parseInt(req.getParameter("id"),0);
//        2、调用VehicleService.deleteVehicle();删除
        vehicleService.deleteVehicleById(cid);
        resp.sendRedirect(req.getContextPath() + "/client/vehicleServlet?action=list");
    }

    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Vehicle vehicle = WebUtils.copyParamToBean(req.getParameterMap(), new Vehicle());
        vehicleService.updateVehicle(vehicle);
        resp.sendRedirect(req.getContextPath() + "/client/vehicleServlet?action=list");
    }
    protected void getVehicle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int vid = WebUtils.parseInt(req.getParameter("id"),0);
        Vehicle vehicle = vehicleService.queryVehicleById(vid);
        req.setAttribute("vehicles",vehicle);
        req.getRequestDispatcher("/page/edit/vehicle_edit.jsp").forward(req,resp);
    }

    protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Vehicle> vehicles = vehicleService.queryVehicles();

        req.setAttribute("vehicles",vehicles);

        req.getRequestDispatcher("/page/client/vehicle.jsp").forward(req,resp);
    }
}
