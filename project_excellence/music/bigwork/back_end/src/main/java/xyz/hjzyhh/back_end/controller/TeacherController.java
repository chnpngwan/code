package xyz.hjzyhh.back_end.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import xyz.hjzyhh.back_end.pojo.AuthTeacherPO;
import xyz.hjzyhh.back_end.service.TeacherService;
import xyz.hjzyhh.back_end.utils.Result;
import xyz.hjzyhh.back_end.utils.ResultUtil;

import javax.servlet.http.HttpSession;

/**
 * 老师操作接口
 */
@RestController
@RequestMapping("/teacher")
public class TeacherController {

    @Autowired
    TeacherService teacherService;

    @PostMapping("/auth")
    public Result<Object> send2Check(@RequestParam("imgs[]") MultipartFile[] imgs,
                                     @RequestParam("description") String description,
                                     HttpSession session) {
        int i = teacherService.send2Check(imgs, description, (long) session.getAttribute("uid"));
        if (i == 1) {
            return ResultUtil.success(null);
        } else {
            return ResultUtil.failure(500, "失败");
        }
    }

    @PostMapping("/modify")
    public Result<Object> modify(@RequestParam("imgs[]") MultipartFile[] imgs,
                                 @RequestParam("description") String description,
                                 HttpSession session) {
        int i = teacherService.modify(imgs, description, (long) session.getAttribute("uid"));
        if (i == 1) {
            return ResultUtil.success(null);
        } else {
            return ResultUtil.failure(500, "失败");
        }
    }


    @GetMapping("/getAuth")
    public Result<AuthTeacherPO> getAuth(HttpSession session) {
        long uid = (long) session.getAttribute("uid");
        AuthTeacherPO auth = teacherService.getAuth(uid);
        // 如果拿到认证是通过的，就在session中标记老师身份。
        if(auth != null && auth.getStatus() == 2){
            session.setAttribute("teacher",true);
        }
        return ResultUtil.success(auth);
    }

    @GetMapping("/drop")
    public Result<Object> drop(HttpSession session) {
        long uid = (long) session.getAttribute("uid");
        int drop = teacherService.drop(uid);
        if (drop != 1) {
            return ResultUtil.failure(500, "drop失败");
        } else {
            session.removeAttribute("teacher");
            return ResultUtil.success(null);
        }
    }

    @GetMapping("/{uid}")
    public Result<AuthTeacherPO> get(@PathVariable("uid") long uid) {
        AuthTeacherPO auth = teacherService.getAuth(uid);
        return ResultUtil.success(auth);
    }
}
