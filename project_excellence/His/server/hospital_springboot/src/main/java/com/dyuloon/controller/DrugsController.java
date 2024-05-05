package com.dyuloon.controller;


import com.dyuloon.entity.Drugs;
import com.dyuloon.entity.Patient;
import com.dyuloon.entity.customEntity.DrugAddEntiy;
import com.dyuloon.from.SearchForm;
import com.dyuloon.service.DrugsService;
import com.dyuloon.service.PatientService;
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
@RequestMapping("/drugs")
public class DrugsController {
    @Autowired
    private DrugsService drugsService;

    // 增
    @PostMapping
    public ResultVO save(@RequestBody Drugs drugs) {
        boolean save = this.drugsService.save(drugs);
        ResultVO resultVO = save ? ResultVOUtil.success(null, "添加成功！") : ResultVOUtil.fail("添加失败！");
        return resultVO;
    }

    // 查
    @GetMapping
    public PageVO query(SearchForm searchForm) {
        PageVO pageVO = this.drugsService.queryPage(searchForm);
        return pageVO;
    }

    // 改
    @PutMapping
    public ResultVO update(@RequestBody Drugs drugs) {
        boolean update = this.drugsService.updateById(drugs);
        ResultVO resultVO = update ? ResultVOUtil.success(null, "更新成功！") : ResultVOUtil.fail("更新失败！");
        return resultVO;
    }

    // 删
    @DeleteMapping("{id}")
    public ResultVO delete(@PathVariable Integer id) {
        boolean remove = this.drugsService.removeById(id);
        ResultVO resultVO = remove ? ResultVOUtil.success(null, "删除成功！") : ResultVOUtil.fail("删除失败！");
        return resultVO;
    }

    // 查询少于一定数量的药物
    @GetMapping("getScarceDrugs")
    public PageVO getScarceDrugs(SearchForm searchForm){
        PageVO pageVO = this.drugsService.getScarceDrugs(searchForm);
        return pageVO;
    }

    // 补货
    @PutMapping("drugReplenishment")
    public ResultVO update(@RequestBody DrugAddEntiy drugAddEntiy) {
        ResultVO resultVO = this.drugsService.drugReplenishment(drugAddEntiy);
        return resultVO;
    }

    // 查全部药品
    @GetMapping("/getAllDrugs")
    public ResultVO getAllDrugs(){
        ResultVO resultVO = this.drugsService.getAllDrugs();
        return resultVO;
    }

}

