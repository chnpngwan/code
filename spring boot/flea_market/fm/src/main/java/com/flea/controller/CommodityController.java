package com.flea.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.flea.common.Result;
import com.flea.entity.Category;
import com.flea.entity.Commodity;
import com.flea.entity.User;
import com.flea.service.CategoryService;
import com.flea.service.CommodityService;
import com.flea.util.JwtUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@RequestMapping("/commodity")
public class CommodityController {

    @Autowired
    private CommodityService commodityService;

    @Autowired
    private CategoryService categoryService;

    /**
     * 新增商品
     * @param commodity
     * @return
     */
    @PostMapping
    public Result<String> save(@RequestBody Commodity commodity){
        log.info("新增商品信息：", commodity.toString());

        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Category::getName, commodity.getCategoryName());
        Category category = categoryService.getOne(queryWrapper);
        commodity.setCategoryId(category.getId());

        //获取当前用户信息，设置为卖家id
        User currentUser = JwtUtil.getCurrentUser();
        commodity.setSellerId(currentUser.getId());

        commodityService.save(commodity);
        return Result.success("新增商品成功！");
    }

    /**
     * 删除商品，关联订单则不允许
     * @param id
     * @return
     */
    @DeleteMapping
    public Result<String> delete(Long id) {
        log.info("删除id为{}的商品", id);
        commodityService.deleteById(id);
        return Result.success("删除商品成功！");
    }

    /**
     * 分页模糊查询
     * @param page
     * @param pageSize
     * @param name
     * @return
     */
    @GetMapping("/page")
    public Result<Page> page(int page, int pageSize,String name) {
        log.info("page = {}, pageSize = {}, name = {}", page, pageSize, name);

        Page pageInfo = new Page<>(page, pageSize);
        LambdaQueryWrapper<Commodity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotEmpty(name), Commodity::getName, name);

        commodityService.page(pageInfo, queryWrapper);
        return Result.success(pageInfo);
    }

    /**
     * 根据分类分页模糊查询商品
     * @param page
     * @param pageSize
     * @param categoryName
     * @param name
     * @return
     */
    @GetMapping("/pageByCategory")
    public Result<Page> pageByCategory(int page, int pageSize, String categoryName, String name){
        log.info("page = {}, pageSize = {},category = {}， name = {}", page, pageSize, categoryName, name);

        Page pageInfo = new Page(page,pageSize);
        LambdaQueryWrapper<Commodity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(StringUtils.isNotEmpty(categoryName), Commodity::getCategoryName, categoryName);
        queryWrapper.eq(Commodity::getStatus, 1);
        queryWrapper.like(StringUtils.isNotEmpty(name), Commodity::getName, name);

        commodityService.page(pageInfo, queryWrapper);
        return Result.success(pageInfo);
    }

    /**
     * 根据分类分页模糊查询商品--后台管理员
     * @param page
     * @param pageSize
     * @param categoryName
     * @param name
     * @return
     */
    @GetMapping("/pageByCategoryManagement")
    public Result<Page> pageByCategoryManagement(int page, int pageSize, String categoryName, String name){
        log.info("page = {}, pageSize = {},category = {}， name = {}", page, pageSize, categoryName, name);

        Page pageInfo = new Page(page,pageSize);
        LambdaQueryWrapper<Commodity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(StringUtils.isNotEmpty(categoryName), Commodity::getCategoryName, categoryName);
        queryWrapper.like(StringUtils.isNotEmpty(name), Commodity::getName, name);

        commodityService.page(pageInfo, queryWrapper);
        return Result.success(pageInfo);
    }

    /**
     * 查询用户售卖的商品
     * @param page
     * @param pageSize
     * @param sellerId
     * @return
     */
    @GetMapping("/pageByShop")
    public Result<Page> pageByShop(int page, int pageSize, Long sellerId){
        log.info("page = {}, pageSize = {},category = {}， name = {}", page, pageSize, sellerId);

        Page pageInfo = new Page(page,pageSize);
        LambdaQueryWrapper<Commodity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Commodity::getSellerId, sellerId);
//        queryWrapper.eq(Commodity::getStatus, 1);
        queryWrapper.orderByDesc(Commodity::getUpdateTime);

        commodityService.page(pageInfo, queryWrapper);
        return Result.success(pageInfo);
    }

    /**
     * 根据id查询商品
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public Result<Commodity> getById(@PathVariable Long id) {
        log.info("查询id为{}的商品:", id);

        Commodity commodity = commodityService.getById(id);
        return Result.success(commodity);
    }

    /**
     * 修改商品，如果已经被购买则不允许
     * @param commodity
     * @return
     */
    @PutMapping
    public Result<String> update(@RequestBody Commodity commodity) {
        log.info("修改商品信息：{}", commodity.toString());

        commodityService.update(commodity);
        return Result.success("修改商品成功！");
    }
}
