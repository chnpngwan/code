package xyz.hjzyhh.back_end.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;
import xyz.hjzyhh.back_end.annotation.ConvertIgnore;
import xyz.hjzyhh.back_end.utils.FileUtils;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("UserPO")
public class UserPO {
  private long id;
  private long createTime;
  private String username;
  @JsonIgnore
  @ConvertIgnore
  private String password;
  @JsonIgnore
  @ConvertIgnore
  private String salt;
  private String nickname;
  private String description;
  private int gender;
  private long birthday;
  private String avatar;

  private int works;
  private int collections;
  private boolean baned;
  private boolean teacher;
  private boolean delete;
}
