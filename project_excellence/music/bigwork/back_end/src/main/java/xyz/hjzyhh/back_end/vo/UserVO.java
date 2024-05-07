package xyz.hjzyhh.back_end.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {
  private long id;
  private long createTime;
  private String username;
  private String nickname;
  private String description;
  private int gender;
  private long birthday;
  private String avatar;
  private int works;
  private int collections;

  private boolean teacher;

}
