package com.example.cinema.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@TableName("tb_lamination")
public class Lamination {
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private Integer cinemaId;
    private Integer hallId;
    private Integer movieId;
    private String langVersion;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",timezone = "GMT+8")
    private Date startDate;
    private String startTime;
    private String endTime;
    private Double price;
    private String seatJson;
    private String tips;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    @TableField(fill = FieldFill.UPDATE)
    private LocalDateTime updateTime;
}
