package xyz.hjzyhh.back_end.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import xyz.hjzyhh.back_end.annotation.NoSample;
import xyz.hjzyhh.back_end.pojo.UserPO;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ClassVO {
    int id;
    String name;
    String description;
    String avatar;
    @NoSample
    UserVO creator;
    int studentNum;
    long createTime;
    @NoSample
    List<UserInClassVO> stu;
}
