package com.example.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {
    private Integer id;
    private String username;
    private String password;
    private String nickname;
    private String avatar;
    private Integer gender;
    private Boolean ableFlag;
    private String email;
    private String telephone;
    private String intro;
    private List<Integer> roleIdList;
}
