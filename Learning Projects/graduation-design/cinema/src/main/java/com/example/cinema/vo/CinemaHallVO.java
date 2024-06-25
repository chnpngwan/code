package com.example.cinema.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CinemaHallVO {
    private Integer id;
    private TypeVO type;
    private String name;
    private Integer seatRow;
    private Integer seatCol;
    private Boolean state;
    private String seatJson;
}
