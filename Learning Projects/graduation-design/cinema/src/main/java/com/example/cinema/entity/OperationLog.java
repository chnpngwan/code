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
@TableName("tb_operation_log")
public class OperationLog {
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String optModule;
    private String optUrl;
    private String optType;
    private String optMethod;
    private String optDesc;
    private String requestMethod;
    private String requestParam;
    private String responseData;
    private Integer userId;
    private String nickname;
    private String ipAddress;
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    @TableField(fill = FieldFill.UPDATE)
    private LocalDateTime updateTime;
}
