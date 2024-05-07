package xyz.hjzyhh.back_end.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import xyz.hjzyhh.back_end.annotation.NoSample;
import xyz.hjzyhh.back_end.pojo.TagPO;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VideoVO {
    private long id;
    private long createTime;
    private String title;
    private String description;
    private String cover;
    private int duration;
    private String video;
    private long playCount;
    private int collectCount;
    @NoSample
    private UserVO creator;
    @NoSample
    private List<TagPO> tags;
    private boolean open;
    private int cid;
    private int commentNum;
}
