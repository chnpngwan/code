package com.example.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CinemaServeDTO {
    private Integer id;
    private Integer cinemaId;
    private Integer serveId;
    private String information;
}
