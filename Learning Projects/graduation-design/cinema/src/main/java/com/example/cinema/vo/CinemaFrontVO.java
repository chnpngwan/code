package com.example.cinema.vo;

import com.example.cinema.entity.Serve;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CinemaFrontVO {
    private Integer id;
    private String name;
    private String address;
    private List<TypeVO> typeList;
    private List<ServeVO> serveList;
}
