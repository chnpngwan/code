package xyz.hjzyhh.back_end.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import xyz.hjzyhh.back_end.annotation.NoSample;
import xyz.hjzyhh.back_end.pojo.VideoPO;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentVO {
    long id;
    @NoSample
    UserVO user;
    @NoSample
    VideoPO video;
    String content;
    long createTime;
}
