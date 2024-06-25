package com.example.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserRegisterDTO {
    private String username;
    private String password;
    private String checkPassword;
    private String email;
    private String code;
    private String nickname;
}
