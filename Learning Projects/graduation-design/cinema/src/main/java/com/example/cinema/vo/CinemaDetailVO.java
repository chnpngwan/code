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
public class CinemaDetailVO {
    private Integer id;
    private String name;
    private String telephone;
    private String address;
    private String image;
    private BrandVO brand;
    private DistrictVO district;
    private List<CinemaServeVO> serveList;
    private List<MovieFrontVO> movieList;
}
