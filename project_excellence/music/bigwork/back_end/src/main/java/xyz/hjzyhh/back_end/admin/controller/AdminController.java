package xyz.hjzyhh.back_end.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import xyz.hjzyhh.back_end.admin.PO.AdminPO;
import xyz.hjzyhh.back_end.admin.service.AdminService;
import xyz.hjzyhh.back_end.utils.Result;
import xyz.hjzyhh.back_end.utils.ResultUtil;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminService adminService;

    @RequestMapping("/login")
    public Result<AdminPO> login(@RequestParam("username") String username,
                                 @RequestParam("password")String password,
                                 HttpSession session){
        AdminPO adminUser = adminService.login(username, password);
        session.setAttribute("aid",adminUser.getId());
        if(adminUser != null){
            return ResultUtil.success(adminUser);
        }else{
            return ResultUtil.failure(ResultUtil.PASSWORD_ERROR_CODE,ResultUtil.PASSWORD_ERROR_MSG);
        }
    }

    @RequestMapping("/status")
    public Result<AdminPO> status(HttpSession session){
        int aid = (int)session.getAttribute("aid");
        return ResultUtil.success(adminService.getById(aid));
    }
}
