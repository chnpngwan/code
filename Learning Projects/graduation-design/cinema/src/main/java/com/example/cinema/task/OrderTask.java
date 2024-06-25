package com.example.cinema.task;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.example.cinema.entity.Lamination;
import com.example.cinema.entity.Movie;
import com.example.cinema.entity.Order;
import com.example.cinema.enums.OrderStatusEnum;
import com.example.cinema.mapper.LaminationMapper;
import com.example.cinema.mapper.OrderMapper;
import com.example.cinema.service.MovieService;
import com.example.cinema.service.impl.MovieServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.Duration;
import java.time.Instant;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Component
public class OrderTask {

    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private LaminationMapper laminationMapper;
    @Autowired
    private MovieServiceImpl movieService;

    @Scheduled(cron = "0/30 * * * * ?")
    @Transactional(rollbackFor = Exception.class)
    public void orderConfirm() {
        log.info("Order Confirm");
        Instant instant = Instant.now().minus(Duration.ofMinutes(15));
        List<Order> orderList = orderMapper.selectList(new LambdaQueryWrapper<Order>()
                .eq(Order::getOrderStatus, OrderStatusEnum.UNPAID.getCode())
                .le(Order::getCreateTime, instant));
        if (CollectionUtils.isEmpty(orderList)) {
            return;
        }
        Set<Integer> laminationId = orderList.stream()
                .map(Order::getLaminationId)
                .collect(Collectors.toSet());
        List<Lamination> laminationList = laminationMapper.selectBatchIds(laminationId);
        Map<Integer, Map<String, JSONArray>> laminationSeatMap = new HashMap<>();
        for (Lamination lamination : laminationList) {
            laminationSeatMap.put(lamination.getId(), (Map<String, JSONArray>) JSON.parseObject(lamination.getSeatJson(), Map.class));
        }
        for (Order order : orderList) {
            List<String> seatList = (List<String>) JSON.parseObject(order.getSeats(), List.class);
            for (String seat : seatList) {
                char[] array = seat.toCharArray();
                StringBuilder builder = new StringBuilder();
                List<Integer> index = new ArrayList<>();
                for (char c : array) {
                    if (c >= '0' && c <= '9') {
                        builder.append(c);
                    } else {
                        index.add(Integer.parseInt(builder.toString()));
                        builder.setLength(0);
                    }
                }
                laminationSeatMap.get(order.getLaminationId()).get(index.get(0) + "").set(index.get(1) - 1, 0);
            }
            order.setOrderStatus(OrderStatusEnum.CLOSED.getCode());
            orderMapper.updateById(order);
        }
        for (Lamination lamination : laminationList) {
            lamination.setSeatJson(JSON.toJSONString(laminationSeatMap.get(lamination.getId())));
            laminationMapper.updateById(lamination);
        }
    }

    @Scheduled(cron = "0 0 0/1 * * ?")
    public void syncMovieInfo() {
        movieService.sync();
    }
}
