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
public class OperationLogVO {
    private Integer id;
    private String optModule;
    private String optUrl;
    private String optType;
    private String optMethod;
    private String optDesc;
    private String requestMethod;
    private String requestParam;
    private String responseData;
    private String nickname;
    private String ipAddress;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private LocalDateTime createTime;
}
