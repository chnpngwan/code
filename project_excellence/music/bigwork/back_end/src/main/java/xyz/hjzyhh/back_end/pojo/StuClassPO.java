package xyz.hjzyhh.back_end.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Alias("StuClassPO")
public class StuClassPO {
    int cid;
    long uid;
    int role;
    long createTime;
}
