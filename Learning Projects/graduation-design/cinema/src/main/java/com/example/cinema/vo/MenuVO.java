package com.example.cinema.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MenuVO {
    private Integer id;
    private String name;
    private String path;
    private String component;
    private String icon;
    private Integer orderNum;
    private Integer isDisable;
    private Integer isHidden;
    private List<MenuVO> children;
    private LocalDateTime createTime;
}
