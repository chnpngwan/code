package com.dyuloon.controller;


import com.dyuloon.entity.Collector;
import com.dyuloon.from.SearchForm;
import com.dyuloon.service.CollectorService;
import com.dyuloon.util.ResultVOUtil;
import com.dyuloon.vo.PageVO;
import com.dyuloon.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author dyuloon
 * @since 2023-06-06
 */
@RestController
@RequestMapping("/collector")
public class CollectorController {
    @Autowired
    private CollectorService collectorService;

    // 增
    @PostMapping
    public ResultVO save(@RequestBody Collector collector) {
        boolean save = this.collectorService.save(collector);
        ResultVO resultVO = save ? ResultVOUtil.success(null,"添加成功！") : ResultVOUtil.fail("添加失败！");
        return resultVO;
    }

    // 查
    @GetMapping("/collectorPatientPage")
    public PageVO query(SearchForm searchForm) {
        PageVO pageVO = this.collectorService.collectorPatientPage(searchForm);
        return pageVO;
    }

    // 改
    @PutMapping
    public ResultVO update(@RequestBody Collector collector){
        boolean update = this.collectorService.updateById(collector);
        ResultVO resultVO = update ? ResultVOUtil.success(null,"更新成功！") : ResultVOUtil.fail("更新失败！");
        return resultVO;
    }

    // 删
    @DeleteMapping("{id}")
    public ResultVO delete(@PathVariable Integer id){
        boolean remove = this.collectorService.removeById(id);
        ResultVO resultVO = remove ? ResultVOUtil.success(null,"删除成功！") : ResultVOUtil.fail("删除失败！");
        return resultVO;
    }

}

