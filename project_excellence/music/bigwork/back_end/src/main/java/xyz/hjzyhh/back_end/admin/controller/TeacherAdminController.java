package xyz.hjzyhh.back_end.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import xyz.hjzyhh.back_end.admin.service.TeacherAdminService;
import xyz.hjzyhh.back_end.pojo.AuthTeacherPO;
import xyz.hjzyhh.back_end.utils.Result;
import xyz.hjzyhh.back_end.utils.ResultUtil;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/admin/teacher")
public class TeacherAdminController {

    @Autowired
    TeacherAdminService teacherAdminService;

    @GetMapping("/get")
    public Result<List<AuthTeacherPO>> get(HttpSession session){
        return ResultUtil.success(teacherAdminService.get((int)session.getAttribute("aid")));
    }

    @GetMapping("/pass/{id}")
    public Result<Object> pass(@PathVariable("id")long id, HttpSession session){
        return ResultUtil.success(teacherAdminService.pass(id,(int)session.getAttribute("aid")));
    }
    @GetMapping("/unpass/{id}")
    public Result<Object> unpass(@PathVariable("id")long id,HttpSession session){
        return ResultUtil.success(teacherAdminService.unpass(id,(int)session.getAttribute("aid")));
    }
    @GetMapping("/exit")
    public Result<Object> exit(HttpSession session){
        return ResultUtil.success(teacherAdminService.exit((int)session.getAttribute("aid")));
    }
}
