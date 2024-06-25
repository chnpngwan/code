package com.example.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ResourceRoleDTO {
    private Integer id;
    private String url;
    private String requestMethod;
    private List<String> roleList;
}
