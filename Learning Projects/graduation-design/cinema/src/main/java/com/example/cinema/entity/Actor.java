package com.example.cinema.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
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
@TableName("tb_actor")
public class Actor {
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String name;
    private String image;
    private Double height;
    private Integer age;
    private Integer gender;
    private String school;
    private String race;
    private Integer bloodType;
    private String constellation;
    private String nation;
    private String information;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    @TableField(fill = FieldFill.UPDATE)
    private LocalDateTime updateTime;
}
