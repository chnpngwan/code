package com.example.cinema.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetailVO {
    private Integer id;
    private String orderId;
    private LaminationOrderVO lamination;
    private String seats;
    private Double totalPrice;
    private Integer orderStatus;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private LocalDateTime createTime;
}
