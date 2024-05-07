package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 *拍卖订单：(AuctionOrder)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "AuctionOrder")
public class AuctionOrder implements Serializable {

    //AuctionOrder编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "auction_order_id")
    private Integer auction_order_id;
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
    // 当前价
    @Basic
    private String current_price;
    // 加价金额
    @Basic
    private Integer mark_up_amount;
    // 买家编号
    @Basic
    private Integer buyer_number;
    // 买家姓名
    @Basic
    private String buyer_name;
    // 联系电话
    @Basic
    private String contact_number;
    // 审核状态
    @Basic
    private String examine_state;
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
