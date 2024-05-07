package com.sofftem.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Event {
    private Integer id;
    private String events_name;//活动名称
    private String bgimg;//背景图片
    private Timestamp datetime;//时间
    private Double tprice;//票价
    private Integer repertory;//库存
    private Integer sale;//售出
    private String introduction;//简介
    private String address;//地址
    private Integer state;//状态
    private String date;
    private String time;
}
