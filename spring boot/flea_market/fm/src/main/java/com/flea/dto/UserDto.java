package com.flea.dto;

import com.flea.entity.User;
import lombok.Data;

@Data
public class UserDto {
    private User user;
    private String token;
}
