package xyz.hjzyhh.back_end.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import xyz.hjzyhh.back_end.pojo.HistroyPO;
import xyz.hjzyhh.back_end.service.HistoryService;
import xyz.hjzyhh.back_end.utils.Result;
import xyz.hjzyhh.back_end.utils.ResultUtil;
import xyz.hjzyhh.back_end.vo.HistoryVO;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/history")
public class HistoryController {
    @Autowired
    HistoryService historyService;

    @GetMapping("/get/{vid}")
    public Result<HistoryVO> get(@PathVariable("vid")long vid, HttpSession session){
        long uid = (long)session.getAttribute("uid");
        HistroyPO histroyPO = historyService.get(uid, vid);
        return ResultUtil.success(histroyPO);
    }

    @PostMapping("/update")
    public Result<Integer> updatetime(@RequestBody HistroyPO histroyPO,HttpSession session){
        long uid = (long)session.getAttribute("uid");
        return ResultUtil.success(historyService.updateTime(histroyPO.getId(),histroyPO.getTime(),uid));
    }

    @PostMapping("/delete/{id}")
    public Result<Object> delete(@PathVariable("id") long id,HttpSession session){
        long uid = (long)session.getAttribute("uid");
        if (historyService.deleteHistory(id,uid)) {
            ResultUtil.success("OK");
        }
        return ResultUtil.failure(500,"删除失败");
    }

    @GetMapping("/list")
    public Result<List<HistoryVO>> getByUid(HttpSession session,@RequestParam("page")int page){
        long uid = (long)session.getAttribute("uid");
        return  ResultUtil.success(historyService.getByUid(uid,page));
    }

    @GetMapping("/list/{vid}")
    public Result<List<HistoryVO>> getByVid(HttpSession session,@PathVariable("vid")long vid,@RequestParam("page")int page){
        long uid = (long)session.getAttribute("uid");
        return  ResultUtil.success(historyService.getByVid(vid,uid,page));
    }
}
