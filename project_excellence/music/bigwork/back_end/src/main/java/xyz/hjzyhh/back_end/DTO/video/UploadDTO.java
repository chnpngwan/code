package xyz.hjzyhh.back_end.DTO.video;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;
import xyz.hjzyhh.back_end.annotation.ConvertIgnore;
import xyz.hjzyhh.back_end.annotation.NoSample;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UploadDTO {
    private long id;
    private long createTime;
    @ConvertIgnore
    @NoSample
    private MultipartFile video;
    @ConvertIgnore
    @NoSample
    private MultipartFile cover;
    private String title;
    private String description;
    private int duration;
    private long playCount;
    private int collectCount;
    private long creator;
    private List<Integer> tags;
    private boolean open;
    private int cid;
}
