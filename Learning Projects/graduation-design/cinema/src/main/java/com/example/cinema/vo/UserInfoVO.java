package com.example.cinema.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserInfoVO {
    private Integer id;
    private String avatar;
    private String nickname;
    private String email;
    private String telephone;
    private String intro;
}
