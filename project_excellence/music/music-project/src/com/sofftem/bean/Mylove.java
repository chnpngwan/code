package com.sofftem.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Mylove {
    private Integer id;
    private Integer music_id;
    private Integer uid;
    private Music music;
}
