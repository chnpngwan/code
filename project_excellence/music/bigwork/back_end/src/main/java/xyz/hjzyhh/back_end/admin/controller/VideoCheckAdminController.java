package xyz.hjzyhh.back_end.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import xyz.hjzyhh.back_end.admin.DTO.VideoCheckDTO;
import xyz.hjzyhh.back_end.admin.service.VideoCheckAdminService;
import xyz.hjzyhh.back_end.utils.Result;
import xyz.hjzyhh.back_end.utils.ResultUtil;
import xyz.hjzyhh.back_end.vo.VideoVO;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/admin/check/video")
public class VideoCheckAdminController {

    @Autowired
    VideoCheckAdminService videoCheck;

    @GetMapping("/get")
    public Result<List<VideoCheckDTO>> get(HttpSession session){
        int aid = (int)session.getAttribute("aid");
        return ResultUtil.success(videoCheck.get(aid));
    }

    @PostMapping("/uncheck")
    public Result<Integer> uncheck(@RequestBody List<Long> ids, HttpSession session){
        int aid = (int)session.getAttribute("aid");
        return ResultUtil.success(videoCheck.uncheck(ids,aid));
    }

    @GetMapping("/pass/{id}")
    public Result<Integer> pass(@PathVariable("id") long id, HttpSession session){
        int aid = (int)session.getAttribute("aid");
        return ResultUtil.success(videoCheck.pass(id,aid));
    }

    @GetMapping("/unpass/{id}")
    public Result<Integer> unpass(@PathVariable("id") long id, HttpSession session){
        int aid = (int)session.getAttribute("aid");
        return ResultUtil.success(videoCheck.unpass(id,aid));
    }


}
