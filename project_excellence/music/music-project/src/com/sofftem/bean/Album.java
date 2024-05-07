package com.sofftem.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Album {
    private Integer id;
    private String album_name;//专辑名
    private String album_faceimg;//专辑图像
    private Date album_Issue_date;//专辑发行日期
    private Integer popularity; //流行度
    private Double price; //价格
    private Integer art_id;//作者id
    private Integer genre_id;

    private Integer count;//歌曲数量
    private String authorname;//专辑作者
}
