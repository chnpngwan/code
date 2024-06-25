package com.example.cinema.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ActorSearchVO {
    private Integer id;
    private String name;
    private String image;
    private String nation;
    private String school;
    private List<MovieSimpleVO> movieList;
}
