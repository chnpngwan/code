package com.example.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PasswordDTO {
    @NotBlank(message = "旧密码不能为空")
    private String oldPassword;
    @Size(min = 6, max = 20, message = "密码长度应在6-20为之间")
    @NotBlank(message = "新密码不能为空")
    private String newPassword;
}
