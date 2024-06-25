package com.example.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Size;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OperationLogDTO {
    @Size(max = 10, message = "关键词最长不能超过10个字符")
    private String keywords;
}
