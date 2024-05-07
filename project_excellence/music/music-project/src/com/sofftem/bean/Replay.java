package com.sofftem.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Replay {
    private Integer replay_id;
    private Integer uid;
    private Integer comment_id;
    private String replaycomment;
    private Integer zanfu;
    private Integer zanzhen;
    private Timestamp regtime;
    private String username;
    private String userfaceimg;
}
