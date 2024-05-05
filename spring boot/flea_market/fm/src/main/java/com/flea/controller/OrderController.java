package com.flea.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.flea.common.Result;
import com.flea.dto.OrderDto;
import com.flea.entity.Commodity;
import com.flea.entity.Orders;
import com.flea.service.CommodityService;
import com.flea.service.OrderDtoService;
import com.flea.service.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/order")
@Slf4j
@RestController
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    CommodityService commodityService;

    @Autowired
    OrderDtoService orderDtoService;

    /**
     * 购买商品相当于新增订单，同时需要修改商品状态为停售
     * @param id
     * @return
     */
    @GetMapping
    public Result<String> buy(Long id){
        log.info("购买商品的id：{}", id);

        //商品停售
        Commodity commodity = commodityService.getById(id);
        commodity.setStatus(2);
        commodityService.update(commodity);

        orderService.saveByCommodity(commodity);
        return Result.success("购买商品成功！");
    }

    /**
     * 修改订单物流状态
     * @return
     */
    @PutMapping
    public Result<String> update(@RequestBody OrderDto orderDto){
//        Orders orders = new Orders();
        Long id = orderDto.getId();
        int status = orderDto.getStatus();
        orderService.update(id, status);
        return Result.success("修改物流信息成功！",1);
//        int order_status = orders.getStatus();
//        if (order_status == 0){
//            if (status == 1){
//                LambdaQueryWrapper<Orders> queryWrapper = new LambdaQueryWrapper<>();
//                queryWrapper.eq(Orders::getId, id);
//                orderService.update(queryWrapper);
//                return Result.success("修改物流信息成功！",1);
//            }else if(status == 2){
//                return Result.error("请先配送订单！",2);
//            }
//        }else if (order_status == 1){
//            if (status == 2){
//                LambdaQueryWrapper<Orders> queryWrapper = new LambdaQueryWrapper<>();
//                queryWrapper.eq(Orders::getId, id);
//                orderService.update(queryWrapper);
//                return Result.success("修改物流信息成功！");
//            }else if(status == 0){
//                return Result.error("订单已送出，不允许修改！",2);
//            }
//        }else{
//            return Result.error("订单已送达，不允许修改物流信息！",2);
//        }
//        return Result.error("未知错误",0);
    }

    /**
     * 根据id获取订单详情信息
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public Result<OrderDto> getById(@PathVariable Long id){
        log.info("查询id为{}的订单", id);

        Orders orders = orderService.getById(id);
        if (orders != null) {
            OrderDto orderDto = orderDtoService.getById(id);
            return Result.success(orderDto);
        }

        return Result.error("未查询到订单信息！");
    }

    /**
     * 根据商品id获取订单详情信息
     * @param id
     * @return
     */
    @GetMapping("/getByCommodityId/{id}")
    public Result<OrderDto> getByCommodityId(@PathVariable Long id){
        LambdaQueryWrapper<Orders> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Orders::getCommodityId, id);
        Orders orders = orderService.getOne(queryWrapper);

        if (orders != null) {
            OrderDto orderDto = orderDtoService.getById(orders.getId());
            return Result.success(orderDto);
        }

        return Result.error("未查询到订单信息！");
    }

    /**
     * 分页查询用户个人的订单
     * @param page
     * @param pageSize
     * @param buyerId
     * @return
     */
    @GetMapping("/pageByBuyer")
    public Result<Page> pageByBuyer(int page, int pageSize, Long buyerId){
        Page pageInfo = new Page<>(page,pageSize);
        LambdaQueryWrapper<Orders> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Orders::getBuyerId, buyerId);
        orderService.page(pageInfo, queryWrapper);
        return Result.success(pageInfo);
    }

    /**
     * 分页查询显示订单
     * @param page
     * @param pageSize
     * @return
     */
    @GetMapping("/page")
    public Result<Page> page(int page, int pageSize, String name) {
        Page pageInfo = new Page<>(page,pageSize);
        LambdaQueryWrapper<Orders> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotEmpty(name), Orders::getCommodityName, name);
        queryWrapper.orderByDesc(Orders::getUpdateTime);

        orderService.page(pageInfo, queryWrapper);
        return Result.success(pageInfo);
    }
}
