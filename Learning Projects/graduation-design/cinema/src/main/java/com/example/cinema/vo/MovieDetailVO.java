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
public class MovieDetailVO {
    private Integer id;
    private Integer time;
    private String nameCn;
    private String nameEn;
    private String image;
    private String intro;
    private AreaVO area;
    private List<CategoryVO> categoryList;
    private List<MovieActorVO> dutyList;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private LocalDateTime releaseTime;
    private Double score;
    private Integer viewCount;
    private Double gross;
}
