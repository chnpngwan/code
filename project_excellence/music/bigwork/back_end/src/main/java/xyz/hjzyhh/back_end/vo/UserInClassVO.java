package xyz.hjzyhh.back_end.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserInClassVO {
    private long id;
    private String nickname;
    private String description;
    private String avatar;
    private boolean teacher;
    private int role;
}
