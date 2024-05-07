package com.sofftem.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Music {
    private Integer id;
    private String song_name;//歌名
    private Integer duration;//时长
    private String facepath;//封面
    private String srcpath;//路径
    private Integer hot;//热度
    private Date barthtime;//热度
    private Integer author_id;//作者id
    private Integer album_id;//专辑id
    private Integer ganer_id;//流派id
    private Integer number; //排序
    private String authorname; //作者名字
}