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
public class MovieActorDutyDTO {
    private Integer movieId;
    private List<Integer> actorIdList;
    private Integer dutyId;
}
