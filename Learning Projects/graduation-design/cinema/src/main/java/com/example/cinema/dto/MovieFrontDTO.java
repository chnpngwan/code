package com.example.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MovieFrontDTO {
    private Integer categoryId;
    private Integer areaId;
    private Integer ageId;
    private Integer orderType;
}
