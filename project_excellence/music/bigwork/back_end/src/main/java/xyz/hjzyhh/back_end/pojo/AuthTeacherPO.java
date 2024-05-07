package xyz.hjzyhh.back_end.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("AuthTeacherPO")
public class AuthTeacherPO {

  private long id;
  private long createTime;
  private long uid;
  @JsonIgnore
  private int adminId;
  private int status;
  @JsonIgnore
  private String imgs;
  private List<String> images;
  private String description;

}
