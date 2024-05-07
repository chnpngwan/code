package com.sofftem.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Live {
    private Integer id;
    private String live_name;//名
    private String live_faceimg;//封面
    private String live_srcpath;//路径
    private String live_phate;//观看人数
    private Integer art_id;//作者id
    private Integer genre_id;//期
    private String author;//作者
    private String genre;//期
}
