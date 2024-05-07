package xyz.hjzyhh.back_end.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import xyz.hjzyhh.back_end.DTO.user.RegistDTO;
import xyz.hjzyhh.back_end.service.UserService;
import xyz.hjzyhh.back_end.utils.FileUtils;
import xyz.hjzyhh.back_end.utils.Result;
import xyz.hjzyhh.back_end.utils.ResultUtil;
import xyz.hjzyhh.back_end.utils.VOUtil;
import xyz.hjzyhh.back_end.vo.UserVO;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * 用户模块controller
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    // 注册接口
    @PostMapping("/register")
    public Result<Object> register(@RequestBody RegistDTO registInfo) {
        boolean b = userService.registUser(registInfo.getUsername(), registInfo.getPassword());
        if (b) {
            return ResultUtil.<Object>success(null);
        } else {
            return ResultUtil.failure(ResultUtil.EXISTS_USERNAME_CODE, ResultUtil.EXISTS_USERNAME_MSG);
        }
    }

    // 登录接口
    @PostMapping("/login")
    public Result<UserVO> login(@RequestBody RegistDTO registInfo, HttpSession session) {
        UserVO user = userService.login(registInfo.getUsername(), registInfo.getPassword());
        if (user == null) {
            return ResultUtil.failure(ResultUtil.LOGIN_FAIL_CODE, ResultUtil.LOGIN_FAIL_MSG);
        }
        session.setAttribute("uid", user.getId());
        // 标记教师登录
        if(user.isTeacher()){
            session.setAttribute("teacher",true);
        }
        session.setMaxInactiveInterval(60 * 60 * 24 * 7);
        return ResultUtil.<UserVO>success(user);
    }

    @GetMapping("/logout")
    public Result<Object> logout(HttpSession session) {
        session.invalidate();
        return ResultUtil.<UserVO>success(null);
    }

    @GetMapping("/{id}")
    public Result<UserVO> getInfo(@PathVariable("id") long id) {
        UserVO user = VOUtil.of(userService.findOne(id));
        if (user == null) {
            return ResultUtil.failure(ResultUtil.USER_MISS_CODE, ResultUtil.USER_MISS_MSG);
        }
        return ResultUtil.success(user);
    }

    @PostMapping("/modify")
    public Result<UserVO> modify(@RequestBody UserVO user) {
        System.out.println(user);
        user = userService.modifyUser(user);
        if (user == null) {
            throw new RuntimeException("修改信息失败");
        }
        return ResultUtil.success(user);
    }

    @PostMapping("/modifypassword")
    public Result<Object> modifypassword(@RequestBody Map<String, String> data,HttpSession session) {
        String[] requiredKey = {"old_password", "new_password"};
        for (String key : requiredKey) {
            if (!data.containsKey(key)) {
                return ResultUtil.failure(ResultUtil.ARGS_MISS_CODE, ResultUtil.ARGS_MISS_MSG);
            }
        }

        long id = (long) session.getAttribute("uid");
        String old_password = null;
        String new_password = null;
        try {
            old_password = data.get("old_password");
            new_password = data.get("new_password");
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("参数异常");
        }
        if (userService.modifyPassword(id, old_password, new_password)) {
            return ResultUtil.success(null);
        } else {
            return ResultUtil.failure(ResultUtil.PASSWORD_ERROR_CODE, ResultUtil.PASSWORD_ERROR_MSG);
        }
    }

    @RequestMapping("/uploadavatar")
    public Result<String> uploadAvatar(@RequestParam("avatar") MultipartFile avatar, HttpSession session) {
        long uid = (long) session.getAttribute("uid");
        String avatarUrl = userService.uploadAvatar(avatar, uid);
        avatarUrl = FileUtils.addContextPath(avatarUrl);
        return ResultUtil.success(avatarUrl);
    }

    @RequestMapping("/status")
    public Result<UserVO> status(HttpSession session) {
        Object uid = session.getAttribute("uid");
        if (uid != null) {
            long id = (long) uid;
            return ResultUtil.success(userService.findOne(id));
        }
        return ResultUtil.failure(400,"未登录");

    }

}
