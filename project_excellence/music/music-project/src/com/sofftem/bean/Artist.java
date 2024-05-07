package com.sofftem.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Artist {
    private Integer id;
    private String art_name; //姓名
    private Date barthTime; //出生日期
    private String nationality; //国继
    private String introduce; //介绍
    private String photograph; //照片路径
    private String link; //歌手链接
    private String genre_id; //类型
}
