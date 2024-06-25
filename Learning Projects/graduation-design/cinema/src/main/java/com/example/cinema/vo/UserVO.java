package com.example.cinema.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {
    private Integer id;
    private String avatar;
    private List<UserRoleVO> roleList;
    private String intro;
    private String nickname;
}
