package xyz.hjzyhh.back_end.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import xyz.hjzyhh.back_end.annotation.NoSample;
import xyz.hjzyhh.back_end.pojo.UserPO;
import xyz.hjzyhh.back_end.pojo.VideoPO;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HistoryVO {
    long id;
    @NoSample
    VideoPO video;
    @NoSample
    UserPO user;
    int time;
    long createTime;
}
