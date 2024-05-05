package cn.web;

import cn.pojo.Package;
import cn.service.PackageService;
import cn.service.impl.PackageServiceImpl;
import cn.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/client/packageServlet")
public class PackageServlet extends BaseServlet{

    private PackageService packageService = new PackageServiceImpl();

    protected void add(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
        Package _package = WebUtils.copyParamToBean(req.getParameterMap(), new Package());
        packageService.addPackage(_package);
        resp.sendRedirect(req.getContextPath() + "/client/packageServlet?action=list");
    }

    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getParameter("id"));
        int pid = WebUtils.parseInt(req.getParameter("id"),0);
//        2、调用packageService.deletePackageById();删除
        packageService.deletePackageById(pid);
        resp.sendRedirect(req.getContextPath() + "/client/packageServlet?action=list");
    }


    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Package _package = WebUtils.copyParamToBean(req.getParameterMap(), new Package());
        packageService.updatePackage(_package);
        resp.sendRedirect(req.getContextPath() + "/client/packageServlet?action=list");
    }


    protected void getPackage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pid = WebUtils.parseInt(req.getParameter("id"),0);
        Package _package = packageService.queryPackageById(pid);
        req.setAttribute("packages",_package);
        req.getRequestDispatcher("/page/edit/package_edit.jsp").forward(req,resp);
    }

    protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        List<Package> packages = packageService.queryPackages();

        req.setAttribute("packages",packages);

        req.getRequestDispatcher("/page/client/index.jsp").forward(req,resp);
    }




}
