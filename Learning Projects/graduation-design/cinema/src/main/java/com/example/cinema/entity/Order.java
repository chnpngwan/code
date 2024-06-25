package com.example.cinema.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@TableName("tb_order")
public class Order {
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String orderId;
    private Integer userId;
    private Integer laminationId;
    private String seats;
    private Double totalPrice;
    private Integer orderStatus;
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    @TableField(fill = FieldFill.UPDATE)
    private LocalDateTime updateTime;
}
