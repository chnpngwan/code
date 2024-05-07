package xyz.hjzyhh.back_end.admin.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import xyz.hjzyhh.back_end.annotation.ConvertIgnore;
import xyz.hjzyhh.back_end.annotation.NoSample;
import xyz.hjzyhh.back_end.vo.UserVO;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VideoCheckDTO {
    @ConvertIgnore
    long check_id;
    long id;
    String title;
    String description;
    long createTime;
    @NoSample
    UserVO creator;
    String cover;
    String video;
    int duration;
}
