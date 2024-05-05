package cn.web;

import cn.pojo.Package;
import cn.pojo.SpecialPackage;
import cn.service.SpecialPackageService;
import cn.service.impl.SpecialPackageServiceImpl;
import cn.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/client/specialPackageServlet")
public class SpecialPackageServlet extends BaseServlet{

    private SpecialPackageService specialPackageService = new SpecialPackageServiceImpl();


    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SpecialPackage specialPackage = WebUtils.copyParamToBean(req.getParameterMap(), new SpecialPackage());
        specialPackageService.addSpecialPackage(specialPackage);
        resp.sendRedirect(req.getContextPath() + "/client/specialPackageServlet?action=list");
    }

    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getParameter("id"));
        int special_pid = WebUtils.parseInt(req.getParameter("id"),0);
//        2、调用SpecialPackageService.deleteSpecialPackageById();删除
        specialPackageService.deleteSpecialPackageById(special_pid);
        resp.sendRedirect(req.getContextPath() + "/client/specialPackageServlet?action=list");
    }


    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SpecialPackage specialPackage = WebUtils.copyParamToBean(req.getParameterMap(), new SpecialPackage());
        specialPackageService.updateSpecialPackage(specialPackage);
        resp.sendRedirect(req.getContextPath() + "/client/specialPackageServlet?action=list");
    }


    protected void getSpecialPackage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int special_pid = WebUtils.parseInt(req.getParameter("id"),0);
        SpecialPackage specialPackage = specialPackageService.querySpecialPackageById(special_pid);
        req.setAttribute("specialPackages",specialPackage);
        req.getRequestDispatcher("/page/edit/specialPackage_edit.jsp").forward(req,resp);
    }

    protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<SpecialPackage> packages = specialPackageService.querySpecialPackages();

        req.setAttribute("specialPackages",packages);

        req.getRequestDispatcher("/page/client/special_package.jsp").forward(req,resp);
    }

}
