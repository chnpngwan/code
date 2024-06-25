package com.example.cinema.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@TableName("tb_movie")
public class Movie {
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String nameCn;
    private String nameEn;
    private String image;
    private Integer time;
    private String intro;
    private Integer areaId;
    private Integer ageId;
    private Double score;
    private Double gross;
    private Integer viewCount;
    private LocalDateTime releaseTime;
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    @TableField(fill = FieldFill.UPDATE)
    private LocalDateTime updateTime;
}
