package com.example.cinema.strategy;

import com.example.cinema.entity.Order;

import java.util.Map;

public interface PayStrategy {
    String createPay(Order order);
    void processOrder(Map<String, String> params);
}
