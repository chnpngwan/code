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
@TableName("tb_movie_actor_duty")
public class MovieActorDuty {
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private Integer movieId;
    private Integer actorId;
    private Integer dutyId;
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    @TableField(fill = FieldFill.UPDATE)
    private LocalDateTime updateTime;
}
