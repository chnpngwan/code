package com.example.cinema.vo;

import com.example.cinema.entity.Age;
import com.example.cinema.entity.Area;
import com.example.cinema.entity.Category;
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
public class MovieVO {
    private Integer id;
    private String nameCn;
    private String nameEn;
    private String image;
    private Integer time;
    private String intro;
    private Area area;
    private Age age;
    private List<Category> categoryList;
    private Double score;
    private Double gross;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private LocalDateTime releaseTime;
}
