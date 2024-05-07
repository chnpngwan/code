package xyz.hjzyhh.back_end.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import xyz.hjzyhh.back_end.pojo.ClassPO;
import xyz.hjzyhh.back_end.service.ClassService;
import xyz.hjzyhh.back_end.utils.FileUtils;
import xyz.hjzyhh.back_end.utils.Result;
import xyz.hjzyhh.back_end.utils.ResultUtil;
import xyz.hjzyhh.back_end.vo.ClassVO;
import xyz.hjzyhh.back_end.vo.UserInClassVO;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * 班级管理的接口
 */
@RestController
@RequestMapping("/class")
public class ClassController {

    @Autowired
    ClassService classService;

    @PostMapping("/create")
    public Result<Boolean> create(@RequestParam("avatar") MultipartFile avatar,
                                  @RequestParam("name") String name,
                                  @RequestParam("description") String description,
                                  HttpSession session) {
        long uid = (long) session.getAttribute("uid");
        if (classService.createClass(avatar, name, description, uid)) {
            return ResultUtil.success(true);
        }
        return ResultUtil.failure(500, "创建班级失败");
    }

    @GetMapping("/get/{cid}")
    public Result<ClassVO> get(@PathVariable("cid") int cid) {
        ClassVO clazz = classService.findOne(cid);
        if (clazz == null) {
            return ResultUtil.failure(400, "未找到班级");
        }
        return ResultUtil.success(clazz);
    }

    @GetMapping("/get")
    public Result<ClassVO> getByName(@RequestParam("name") String name) {
        ClassVO clazz = classService.findOne(name);
        if (clazz == null) {
            return ResultUtil.failure(400, "未找到班级");
        }
        return ResultUtil.success(clazz);
    }

    @GetMapping("/myclass")
    public Result<List<ClassPO>> getMyClass(HttpSession session) {
        long uid = (long) session.getAttribute("uid");
        return ResultUtil.success(classService.findMyClass(uid));
    }

    @GetMapping("/user/{uid}")
    public Result<List<ClassPO>> getByCreator(@PathVariable("uid")long uid) {
        return ResultUtil.success(classService.getByCreator(uid));
    }

    @PostMapping("/modifyInfo")
    public Result<Object> modifyInfo(@RequestBody ClassPO classPO, HttpSession session) {
        long uid = (long) session.getAttribute("uid");
        if (classService.modifyClassInfo(classPO.getId(), classPO.getName(), classPO.getDescription(), uid)) {
            return ResultUtil.success("OK");
        }
        return ResultUtil.failure(500, "修改失败");
    }

    @PostMapping("/modifyAvatar")
    public Result<Object> modifyAvatar(@RequestParam("avatar") MultipartFile avatar, @RequestParam("id") int cid, HttpSession session) {
        long uid = (long) session.getAttribute("uid");
        if (classService.modifyClassAvatar(cid, avatar, uid)) {
            return ResultUtil.success("OK");
        }
        return ResultUtil.failure(500, "修改失败");
    }


    @PostMapping("/modifyCreator")
    public Result<Object> modifyCreator(@RequestBody Map<String, Long> args, HttpSession session) {
        if (args.containsKey("cid") && args.containsKey("uid")) {
            long uid = (long) session.getAttribute("uid");
            int cid = (int) (long) args.get("cid");
            long athoruid = args.get("uid");
            if (classService.modifyClassCreator(cid, athoruid, uid)) {
                return ResultUtil.success("OK");
            }
            return ResultUtil.failure(500, "修改失败");

        } else {
            return ResultUtil.failure(400, "参数异常");
        }
    }

    @GetMapping("/delete/{cid}")
    public Result<Object> delete(@PathVariable("cid") int cid, HttpSession session) {
        long uid = (long) session.getAttribute("uid");
        if (classService.deleteClass(uid, cid)) {
            return ResultUtil.success("OK");
        }
        return ResultUtil.failure(500, "修改失败");
    }

    /**
     * 添加到班级
     *
     * @param cid     班级ID
     * @param session session 用于获取uid
     * @return
     */
    @GetMapping("/add/{cid}")
    public Result<Object> add2Class(@PathVariable("cid") int cid, HttpSession session) {
        long uid = (long) session.getAttribute("uid");
        if (classService.add2Class(cid, uid)) {
            return ResultUtil.success("OK");
        }
        return ResultUtil.failure(500, "添加失败");
    }

    @PostMapping("/removeFromClass")
    public Result<Object> removeFromClass(@RequestBody Map<String, String> args,
                                          HttpSession session) {
        if (args.containsKey("uid") && args.containsKey("cid")) {
            long uid = Long.parseLong(args.get("uid"));
            int cid = Integer.parseInt(args.get("cid"));
            long option_uid = Long.parseLong(String.valueOf(session.getAttribute("uid")));
            if (classService.removeFromClass(cid,uid,option_uid)) {
                return ResultUtil.success("OK");
            }
        }else{
            throw new RuntimeException("参数异常");
        }
        return ResultUtil.failure(500,"退出失败");
    }

    @PostMapping("/changeRole")
    public Result<Object> changeRole(@RequestBody Map<String, String> args,
                                     HttpSession session){
        if (args.containsKey("uid") && args.containsKey("cid") && args.containsKey("role")) {
            long uid = Long.parseLong(args.get("uid"));
            int cid = Integer.parseInt(args.get("cid"));
            int role = Integer.parseInt(args.get("role"));
            long option_uid = Long.parseLong(String.valueOf(session.getAttribute("uid")));
            if (classService.changeRole(cid,uid,role,option_uid)) {
                return ResultUtil.success("OK");
            }
        }else {
            throw new RuntimeException("参数异常");
        }
        return ResultUtil.failure(500,"修改失败");
    }

    @GetMapping("/stuList/{cid}")
    public Result<List<UserInClassVO>> getStuList(@PathVariable("cid")int cid,
                                                  @RequestParam("page")int page){
        return ResultUtil.success(classService.getStuList(cid, page));
    }

}
