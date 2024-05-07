package com.sofftem.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Produce {
    private Integer id;
    private String pname;//商品名
    private Double oldprice;//商品初价格
    private Double price;//商品价格
    private Integer repertory;//库存
    private Integer sale;//售出
    private String introduction;//介绍
    private Integer imga_id;//图像
    private Integer comment_id;//评论
    private Integer genre_id;//类别
    private String imga;//封面
}
