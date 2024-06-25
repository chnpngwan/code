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
public class HomePageVO {
    private Integer viewCount;
    private Long userCount;
    private Long movieCount;
    private Long commentCount;
    private List<WeekGrossVO> weekGrossList;
    private List<MovieViewVO> movieViewVOList;
    private List<MovieCategoryVO> movieCategoryVOList;
}
