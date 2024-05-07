package xyz.hjzyhh.back_end.admin.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import xyz.hjzyhh.back_end.admin.PO.UserSelector;
import xyz.hjzyhh.back_end.admin.service.UserAdminService;
import xyz.hjzyhh.back_end.pojo.UserPO;
import xyz.hjzyhh.back_end.service.UserService;
import xyz.hjzyhh.back_end.utils.Result;
import xyz.hjzyhh.back_end.utils.ResultUtil;
import xyz.hjzyhh.back_end.utils.VOUtil;
import xyz.hjzyhh.back_end.vo.UserVO;

import java.util.List;

@RestController
@RequestMapping("/admin/user")
public class UserAdminController {

    public final int PAGE_LIMIT = 20;

    @Autowired
    UserAdminService userAdminService;

    @Autowired
    UserService userService;

    @GetMapping("/get/{page}")
    public Result<List<UserPO>> getUser(@PathVariable("page") int page) {
        long offset = (page - 1)*PAGE_LIMIT;
        List<UserPO> users = userAdminService.getUsers(offset, PAGE_LIMIT);
        return ResultUtil.success(users);
    }

    @PostMapping("/getBySelector/{page}")
    public Result<List<UserPO>> getBySelector(@RequestBody UserSelector userSelector,
                                              @PathVariable("page") int page) {
        long offset = (page - 1)*PAGE_LIMIT;
        List<UserPO> users = userAdminService.getUsersBySelector(userSelector, PAGE_LIMIT,offset);
        return ResultUtil.success(users);
    }

    @GetMapping("/ban/{id}")
    public Result<Integer> ban(@PathVariable("id") long id) {
        int i = userAdminService.ban(id);
        if(i != 0) {
            return ResultUtil.success(i);
        }
        else{
            return ResultUtil.failure(500,"操作失败");
        }
    }

    @GetMapping("/unban/{id}")
    public Result<Integer> unban(@PathVariable("id") long id) {
        int i = userAdminService.unban(id);
        if(i != 0) {
            return ResultUtil.success(i);
        }
        else{
            return ResultUtil.failure(500,"操作失败");
        }
    }

    @GetMapping("/delete/{id}")
    public Result<Integer> delete(@PathVariable("id") long id) {
        int i = userAdminService.delete(id);
        if(i != 0) {
            return ResultUtil.success(i);
        }
        else{
            return ResultUtil.failure(500,"操作失败");
        }
    }

    @GetMapping("/undelete/{id}")
    public Result<Integer> undelete(@PathVariable("id") long id) {
        int i = userAdminService.undelete(id);
        if(i != 0) {
            return ResultUtil.success(i);
        }
        else{
            return ResultUtil.failure(500,"操作失败");
        }
    }

    @PostMapping("/modify")
    public Result<UserVO> modify(@RequestBody UserPO po) {
        UserVO userVO = userService.modifyUser(VOUtil.swap(po, UserVO.class));
        if(userVO != null) {
            return ResultUtil.success(userVO);
        }
        else{
            return ResultUtil.failure(500,"操作失败");
        }
    }


}
