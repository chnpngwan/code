package com.zpark.legou.goods;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Goods {

    private String gid; //商品编号

    private String url; //商品图片

    private Double price; //商品单价

    private String title; //商品名称

    private Integer stock; //商品库存

    private String type; //商品类型

    private GoodsStatusEnum status; //商品状态

    private LocalDateTime updateTime; //创建/修改时间
}
