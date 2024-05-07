package xyz.hjzyhh.back_end.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("CheckVideoPO")
public class CheckVideoPO {

  private long id;
  private long createTime;
  private long vid;
  private int adminId;
  private int status;

}
