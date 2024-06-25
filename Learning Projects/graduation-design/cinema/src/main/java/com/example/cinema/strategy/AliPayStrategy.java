package com.example.cinema.strategy;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.AlipayConstants;
import com.alipay.api.domain.AlipayTradePagePayModel;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.response.AlipayTradePagePayResponse;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.example.cinema.constant.RedisPreFixConstant;
import com.example.cinema.entity.Lamination;
import com.example.cinema.entity.Order;
import com.example.cinema.enums.OrderStatusEnum;
import com.example.cinema.mapper.LaminationMapper;
import com.example.cinema.mapper.OrderMapper;
import com.example.cinema.service.RedisService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Map;
import java.util.concurrent.locks.ReentrantLock;

@Slf4j
@Component
public class AliPayStrategy implements PayStrategy{
    @Value("${ali-pay.notify-url}")
    private String notifyUrl;
    @Value("${ali-pay.return-url}")
    private String returnUrl;
    @Value("${ali-pay.public-key}")
    private String publicKey;
    @Autowired
    private AlipayClient alipayClient;
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private LaminationMapper laminationMapper;
    @Autowired
    private RedisService redisService;

    private final ReentrantLock lock = new ReentrantLock();

    @Override
    public String createPay(Order order) {
        AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();
        AlipayTradePagePayModel bizModel = new AlipayTradePagePayModel();
        bizModel.setOutTradeNo(order.getOrderId());
        bizModel.setTotalAmount(order.getTotalPrice().toString());
        bizModel.setSubject(order.getOrderId());
        bizModel.setProductCode("FAST_INSTANT_TRADE_PAY");
        request.setBizModel(bizModel);
        request.setNotifyUrl(notifyUrl);
        request.setReturnUrl(returnUrl);
        AlipayTradePagePayResponse response = null;
        try{
            //完成签名并执行请求
            response = alipayClient.pageExecute(request);
            if(response.isSuccess()){
                log.debug("调用成功");
                return response.getBody();
            }
            else{
                log.error("调用失败");
                log.error(response.getMsg());
                return null;
            }
        } catch(AlipayApiException e){
            log.error("调用异常");
            return null;
        }
    }

    @Override
    public void processOrder(Map<String, String> params) {
        log.info("回调成功");
        String orderNo = params.get("out_trade_no");
        if(lock.tryLock()) {
            try {
                Order order = orderMapper.selectOne(new LambdaQueryWrapper<Order>()
                        .eq(Order::getOrderId, orderNo));
                if (!order.getOrderStatus().equals(OrderStatusEnum.UNPAID.getCode())) {
                    return;
                }
                Lamination lamination = laminationMapper.selectById(order.getLaminationId());
                redisService.zIncr(RedisPreFixConstant.RANK_TODAY_GROSS, order.getTotalPrice(), lamination.getMovieId());
                order.setOrderStatus(OrderStatusEnum.PAID.getCode());
                orderMapper.updateById(order);
            } finally {
                //要主动释放锁
                lock.unlock();
            }
        }
    }
}
