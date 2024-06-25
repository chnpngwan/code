package com.example.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserDisableDTO {
    @NotNull(message = "用户id不能为空")
    private Integer id;
    @NotNull(message = "禁用状态不能为空")
    private Boolean ableFlag;
}
