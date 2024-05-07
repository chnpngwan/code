package xyz.hjzyhh.back_end.DTO.video;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;
import xyz.hjzyhh.back_end.annotation.NoSample;
import xyz.hjzyhh.back_end.pojo.TagPO;
import xyz.hjzyhh.back_end.pojo.UserPO;
import xyz.hjzyhh.back_end.vo.UserVO;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VideoDTO {
    private long id;
    private long createTime;
    private String video;
    private String cover;
    private String title;
    private String description;
    private int duration;
    private long playCount;
    private int collectCount;
    @NoSample
    private UserPO creator;
    @NoSample
    private List<TagPO> tags;
    private boolean open;
    private int cid;
    private int commentNum;
}
