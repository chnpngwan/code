package com.example.cinema.vo;

import com.example.cinema.entity.Duty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ActorDetailVO {
    private Integer id;
    private String name;
    private String image;
    private Double height;
    private Integer age;
    private Integer gender;
    private String school;
    private String race;
    private Integer bloodType;
    private String constellation;
    private String nation;
    private String information;
    private List<Duty> dutyList;
    private List<MovieFrontVO> movieList;
    private List<ActorVO> relationshipList;
}
