package xyz.hjzyhh.back_end.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import xyz.hjzyhh.back_end.pojo.TagPO;
import xyz.hjzyhh.back_end.service.TagService;
import xyz.hjzyhh.back_end.utils.Result;
import xyz.hjzyhh.back_end.utils.ResultUtil;

import java.util.List;
import java.util.Map;

/**
 * tag管理的接口
 */
@RestController
@RequestMapping("/tag")
public class TagController {
    @Autowired
    TagService tagService;

    @PostMapping("/add")
    public Result<Object> addTag(@RequestBody Map<String, String> namemap) {
        if (namemap.containsKey("name")) {
            String name = namemap.get("name");
            if (tagService.addTag(name)) {
                return ResultUtil.success(null);
            }
            return ResultUtil.failure(500, "添加失败");
        }
        return ResultUtil.failure(500,"参数异常");
    }

    @PostMapping("/recommend")
    public Result<List<TagPO>> recommend(@RequestBody Map<String, String> keywordmap) {
        if (keywordmap.containsKey("keyword")) {
            String keyword = keywordmap.get("keyword");
            return ResultUtil.success(tagService.recommend(keyword));
        }
        return ResultUtil.failure(500,"参数异常");
    }

    @PostMapping("/{tid}")
    public Result<TagPO> findOne(@PathVariable("tid") int tid) {
        return ResultUtil.success(tagService.findOne(tid));
    }

    /**
     * 获取主页展示的tag
     * @return
     */
    @GetMapping("/get/{page}")
    public Result<List<TagPO>> get(@PathVariable("page")int page){
        return ResultUtil.success(tagService.get(page));
    }
}
