package xyz.hjzyhh.back_end.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import xyz.hjzyhh.back_end.admin.PO.UserSelector;
import xyz.hjzyhh.back_end.admin.PO.VideoSelector;
import xyz.hjzyhh.back_end.admin.service.VideoAdminService;
import xyz.hjzyhh.back_end.pojo.UserPO;
import xyz.hjzyhh.back_end.pojo.VideoPO;
import xyz.hjzyhh.back_end.utils.Result;
import xyz.hjzyhh.back_end.utils.ResultUtil;

import java.util.List;

@RestController
@RequestMapping("/admin/video")
public class VideoAdminController {
    public final int PAGE_LIMIT = 20;

    @Autowired
    VideoAdminService videoAdminService;

    @PostMapping("/getBySelector/{page}")
    public Result<List<VideoPO>> getBySelector(@RequestBody VideoSelector videoSelector,
                                               @PathVariable("page") int page) {
        long offset = (page - 1)*PAGE_LIMIT;
        List<VideoPO> videos = videoAdminService.getBySelector(videoSelector, PAGE_LIMIT,offset);
        return ResultUtil.success(videos);
    }


    @GetMapping("/ban/{id}")
    public Result<Integer> ban(@PathVariable("id") long id) {
        int i = videoAdminService.ban(id);
        if(i != 0) {
            return ResultUtil.success(i);
        }
        else{
            return ResultUtil.failure(500,"操作失败");
        }
    }

    @GetMapping("/unban/{id}")
    public Result<Integer> unban(@PathVariable("id") long id) {
        int i = videoAdminService.unban(id);
        if(i != 0) {
            return ResultUtil.success(i);
        }
        else{
            return ResultUtil.failure(500,"操作失败");
        }
    }

    @GetMapping("/delete/{id}")
    public Result<Integer> delete(@PathVariable("id") long id) {
        int i = videoAdminService.delete(id);
        if(i != 0) {
            return ResultUtil.success(i);
        }
        else{
            return ResultUtil.failure(500,"操作失败");
        }
    }

    @GetMapping("/undelete/{id}")
    public Result<Integer> undelete(@PathVariable("id") long id) {
        int i = videoAdminService.undelete(id);
        if(i != 0) {
            return ResultUtil.success(i);
        }
        else{
            return ResultUtil.failure(500,"操作失败");
        }
    }
}
