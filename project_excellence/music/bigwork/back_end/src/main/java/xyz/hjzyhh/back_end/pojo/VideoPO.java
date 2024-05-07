package xyz.hjzyhh.back_end.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;
import xyz.hjzyhh.back_end.utils.FileUtils;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("VideoPO")
public class VideoPO {

  private long id;
  private long createTime;
  private long creator;
  private String title;
  private String description;
  private String cover;
  private int duration;
  private String video;
  private long playCount;
  private int collectCount;
  private boolean open;
  private boolean baned;
  private int cid;
  private int commentNum;
  private boolean show;
}
