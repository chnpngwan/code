package com.example.cinema.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class LaminationDetailVO {
    private Integer id;
    private HallSimpleVO hall;
    private String langVersion;
    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    private Date startDate;
    private String startTime;
    private String endTime;
    private Double price;
    private String tips;
}
