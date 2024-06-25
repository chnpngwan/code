package com.example.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserRoleDTO {
    @NotNull(message = "id不能为空")
    private Integer userInfoId;
    @NotBlank(message = "昵称不能为空")
    private String nickname;
    @NotNull(message = "用户角色不能为空")
    private List<Integer> roleIdList;
}
