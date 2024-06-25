package com.example.cinema.service.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.cinema.constant.RedisPreFixConstant;
import com.example.cinema.dto.OrderDTO;
import com.example.cinema.entity.Lamination;
import com.example.cinema.entity.Order;
import com.example.cinema.enums.OrderStatusEnum;
import com.example.cinema.mapper.LaminationMapper;
import com.example.cinema.mapper.OrderMapper;
import com.example.cinema.service.LaminationService;
import com.example.cinema.service.OrderService;
import com.example.cinema.service.RedisService;
import com.example.cinema.strategy.AliPayStrategy;
import com.example.cinema.utils.BeanCopyUtil;
import com.example.cinema.utils.PageUtil;
import com.example.cinema.vo.LaminationOrderVO;
import com.example.cinema.vo.OrderDetailVO;
import com.example.cinema.vo.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {
    @Autowired
    private LaminationMapper laminationMapper;
    @Autowired
    private LaminationService laminationService;
    @Autowired
    private RedisService redisService;
    @Autowired
    private AliPayStrategy aliPayStrategy;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Integer saveOrder(OrderDTO orderDTO) {
        Long flag = redisService.sRem(RedisPreFixConstant.ORDER_TOKEN, orderDTO.getToken());
        if (flag == 0) {
            throw new RuntimeException("请勿重复创建订单！");
        }
        Lamination lamination = laminationMapper.selectById(orderDTO.getLaminationId());
        BigDecimal bigDecimal = new BigDecimal(lamination.getPrice().toString());
        Map<String, JSONArray> seatMap = JSON.parseObject(lamination.getSeatJson(), Map.class);
        List<String> seatList = (List<String>) JSON.parseObject(orderDTO.getSeats(), List.class);
        for (String seat : seatList) {
            StringBuilder builder = new StringBuilder();
            List<Integer> index = new ArrayList<>();
            for (char c : seat.toCharArray()) {
                if (c >= '0' && c <= '9') {
                    builder.append(c);
                } else {
                    index.add(Integer.parseInt(builder.toString()));
                    builder.setLength(0);
                }
            }
            seatMap.get(index.get(0) + "").set(index.get(1) - 1, 3);
        }
        lamination.setSeatJson(JSON.toJSONString(seatMap));
        laminationMapper.updateById(lamination);
        double totalPrice = bigDecimal.multiply(new BigDecimal(seatList.size())).doubleValue();
        Order order = Order.builder()
                .orderId(UUID.randomUUID().toString())
                .userId(orderDTO.getUserId())
                .laminationId(orderDTO.getLaminationId())
                .seats(orderDTO.getSeats())
                .totalPrice(totalPrice)
                .orderStatus(OrderStatusEnum.UNPAID.getCode())
                .build();
        baseMapper.insert(order);
        return order.getId();
    }

    @Override
    public PageResult<OrderDetailVO> getOrderUser(Integer userId) {
        Page<Order> page = new Page<>(PageUtil.getCurrent(), PageUtil.getSize());
        Page<Order> orderPage = baseMapper.selectPage(page, new LambdaQueryWrapper<Order>()
                .eq(Order::getUserId, userId)
                .orderByDesc(Order::getCreateTime));
        List<OrderDetailVO> orderDetailVOList = orderPage.getRecords().stream().map(order -> {
            LaminationOrderVO laminationOrderVO = laminationService.getLaminationOrderById(order.getLaminationId());
            OrderDetailVO orderDetailVO = BeanCopyUtil.copyObject(order, OrderDetailVO.class);
            orderDetailVO.setLamination(laminationOrderVO);
            return orderDetailVO;
        }).collect(Collectors.toList());
        return new PageResult<>(orderDetailVOList, orderPage.getTotal());
    }

    @Override
    public OrderDetailVO getOrderDetail(Integer orderId) {
        Order order = baseMapper.selectById(orderId);
        LaminationOrderVO laminationOrderVO = laminationService.getLaminationOrderById(order.getLaminationId());
        OrderDetailVO orderDetailVO = BeanCopyUtil.copyObject(order, OrderDetailVO.class);
        orderDetailVO.setLamination(laminationOrderVO);
        return orderDetailVO;
    }

    @Override
    public String payOrder(Integer orderId) {
        Order order = baseMapper.selectById(orderId);
        return aliPayStrategy.createPay(order);
    }
}
