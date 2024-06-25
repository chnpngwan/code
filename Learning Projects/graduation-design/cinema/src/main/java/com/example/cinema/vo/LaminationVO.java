package com.example.cinema.vo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
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
public class LaminationVO {
    private Integer id;
    private CinemaSimpleVO cinema;
    private HallSimpleVO hall;
    private MovieSimpleVO movie;
    private String langVersion;
    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    private LocalDateTime startDate;
    private String startTime;
    private String endTime;
    private Double price;
    private String seatJson;
    private String tips;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private LocalDateTime createTime;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private LocalDateTime updateTime;
}
