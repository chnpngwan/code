package com.example.cinema.controller;

import com.example.cinema.dto.OrderDTO;
import com.example.cinema.service.OrderService;
import com.example.cinema.strategy.AliPayStrategy;
import com.example.cinema.vo.OrderDetailVO;
import com.example.cinema.vo.PageResult;
import com.example.cinema.vo.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/order")
public class OrderController {
    @Value("${ali-pay.public-key}")
    private String publicKey;
    @Autowired
    private OrderService orderService;
    @Autowired
    private AliPayStrategy aliPayStrategy;

    @GetMapping("/detail")
    public Response<OrderDetailVO> getOrderDetail(Integer orderId) {
        return Response.success(orderService.getOrderDetail(orderId));
    }

    @GetMapping("/user")
    public Response<PageResult<OrderDetailVO>> getOrderUser(Integer userId) {
        return Response.success(orderService.getOrderUser(userId));
    }

    @PostMapping
    public Response<Integer> saveOrUpdateOrder(@RequestBody OrderDTO orderDTO) {
        return Response.success(orderService.saveOrder(orderDTO));
    }

    @PostMapping("/status")
    public String updateOrderStatus(@RequestParam Map<String, String> params) {
        String result = "failure";
        aliPayStrategy.processOrder(params);
        result = "success";
        return result;
    }

    @PutMapping("/pay/{orderId}")
    public Response<String> payOrder(@PathVariable Integer orderId) {
        return Response.success(orderService.payOrder(orderId));
    }
}
