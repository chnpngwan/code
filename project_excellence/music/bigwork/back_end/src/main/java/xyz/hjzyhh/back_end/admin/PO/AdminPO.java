package xyz.hjzyhh.back_end.admin.PO;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Alias("AdminPO")
public class AdminPO {

  private int id;
  private long createTime;
  private String username;

}
