package com.sofftem.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
    private Integer id;
    private Integer uid;
    private String comment;
    private Integer zanzhen;
    private Integer zanfu;
    private Integer album_id;
    private List<Replay> replay;
    private Timestamp regtime;
    private String username;
    private String userfaceimg;
}