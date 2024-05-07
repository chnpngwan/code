package com.sofftem.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    private String order_id;//订单编号
    private Timestamp create_time;
    private Double total_price;
    private Integer status;
    private Integer uid;
    private Integer count;
}
