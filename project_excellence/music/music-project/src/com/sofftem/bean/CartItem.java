package com.sofftem.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartItem {
    private Integer id;
    private Integer pid;//商品
    private Integer count;//数量
    private Integer uid;//用户
    private String pname;//商品名
    private Double price;//单价
    private Double oldprice;//原价
    private String faceimg;//图片
    private Double totalPrice;//总价
}
