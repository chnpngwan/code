package com.example.cinema.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class LaminationOrderVO {
    private Integer id;
    private CinemaSimpleVO cinema;
    private HallSimpleVO hall;
    private MovieVO movie;
    private String langVersion;
    private String seatJson;
    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    private Date startDate;
    private String startTime;
    private String endTime;
    private Double price;
}
