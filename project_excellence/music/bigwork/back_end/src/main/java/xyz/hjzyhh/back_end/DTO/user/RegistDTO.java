package xyz.hjzyhh.back_end.DTO.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class RegistDTO {
    private String username;
    private String password;
    private String salt;
}
