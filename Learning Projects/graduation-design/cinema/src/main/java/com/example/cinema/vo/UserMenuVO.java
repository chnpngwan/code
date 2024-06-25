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
public class UserMenuVO {
    private String name;
    private String path;
    private String component;
    private String icon;
    private Boolean hidden;
    private List<UserMenuVO> children;
}
