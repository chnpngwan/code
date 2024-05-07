package xyz.hjzyhh.back_end.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("HistroyPO")
public class HistroyPO {
    long id;
    long vid;
    long uid;
    int time;
    long createTime;
}
