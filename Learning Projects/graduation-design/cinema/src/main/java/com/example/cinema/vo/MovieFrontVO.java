package com.example.cinema.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
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
public class MovieFrontVO {
    private Integer id;
    private String nameCn;
    private String image;
    private List<CategoryVO> categoryList;
    private List<ActorVO> actorList;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private LocalDateTime releaseTime;
    private Double score;
}
