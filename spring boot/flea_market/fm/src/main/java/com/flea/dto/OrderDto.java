package com.flea.dto;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 订单详情扩展类
 */
@Data
public class OrderDto {

    private Long id;

    private String categoryName;

    private String commodityName;

    private Long commodityId;

    private BigDecimal price;

    private String description;

    private String sellerName;

    private Long sellerId;

    private String buyerName;

    private Long buyerId;

    private Integer status;
}
