package xyz.hjzyhh.back_end.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import xyz.hjzyhh.back_end.DTO.SearchSelector;
import xyz.hjzyhh.back_end.service.SearchService;
import xyz.hjzyhh.back_end.utils.Result;
import xyz.hjzyhh.back_end.utils.ResultUtil;

import java.util.List;

@RestController
public class SearchController {

    @Autowired
    SearchService searchService;

    @PostMapping("/search/{page}")
    public Result<List<Object>> search(@RequestBody SearchSelector selector,@PathVariable("page")int page){
        return ResultUtil.success(searchService.search(selector,page));
    }

}
