package xyz.hjzyhh.back_end.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import xyz.hjzyhh.back_end.service.CommentService;
import xyz.hjzyhh.back_end.utils.Result;
import xyz.hjzyhh.back_end.utils.ResultUtil;
import xyz.hjzyhh.back_end.vo.CommentVO;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    CommentService commentService;

    @PostMapping("/publish")
    public Result<CommentVO> publish(@RequestParam("content")String content,
                                     @RequestParam("vid") long vid,
                                     HttpSession session){
        long uid = (long) session.getAttribute("uid");
        CommentVO commentVO = commentService.insertComment(uid, vid, content);
        return ResultUtil.success(commentVO);
    }

    @GetMapping("/video/{vid}")
    public Result<List<CommentVO>> getVideoComments(@PathVariable("vid")long vid,@RequestParam("page")int page){
        return ResultUtil.success(commentService.getVideoComments(vid,page));
    }

    @GetMapping("/my")
    public Result<List<CommentVO>> geMyComments(@RequestParam("page")int page,HttpSession session){
        long uid = (long) session.getAttribute("uid");
        return ResultUtil.success(commentService.getMyComments(uid,page));
    }

    @PostMapping("/delete/{id}")
    public Result<Object> deleteComment(@PathVariable("id")long id,HttpSession session){
        long uid = (long) session.getAttribute("uid");
        if (commentService.deleteComment(id,uid)) {
            return ResultUtil.success("OK");
        }
        return ResultUtil.failure(500,"删除失败");
    }

    @PostMapping("/modifyContent")
    public Result<CommentVO> modifyContent(@RequestParam("id")long id,@RequestParam("content")String content,HttpSession session){
        long uid = (long) session.getAttribute("uid");
        CommentVO commentVO = commentService.updateContent(id, content, uid);
        return ResultUtil.success(commentVO);
    }
}
