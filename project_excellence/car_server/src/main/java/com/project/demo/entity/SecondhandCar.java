package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 *二手汽车：(SecondhandCar)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "SecondhandCar")
public class SecondhandCar implements Serializable {

    //SecondhandCar编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "secondhand_car_id")
    private Integer secondhand_car_id;
    // 拍卖单号
    @Basic
    private String auction_number;
    // 卖家编号
    @Basic
    private Integer seller_number;
    // 卖家姓名
    @Basic
    private String seller_name;
    // 标题
    @Basic
    private String title;
    // 品牌
    @Basic
    private String brand;
    // 照片
    @Basic
    private String photo;
    // 购入年份
    @Basic
    private String year_of_purchase;
    // 行驶公里数
    @Basic
    private String kilometers_traveled;
    // 起拍价
    @Basic
    private Integer starting_price;
    // 当前价
    @Basic
    private Integer current_price;
    // 拍卖方式
    @Basic
    private String auction_mode;
    // 汽车参数
    @Basic
    private String vehicle_parameters;
    // 详情
    @Basic
    private String details;
    // 点击数
    @Basic
    private Integer hits;
    // 点赞数
    @Basic
    private Integer praise_len;
    // 审核状态
    @Basic
    private String examine_state;
	// 计时器标题
	@Basic
	private String timer_title;
	
	// 计时开始时间
	@Basic
	private Timestamp timing_start_time;
	
	// 计时结束时间
	@Basic
	private Timestamp timing_end_time;
    // 审核回复
    @Basic
    private String examine_reply;

    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
