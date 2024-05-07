package xyz.hjzyhh.back_end.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Alias("ClassPO")
public class ClassPO {
    int id;
    String name;
    String description;
    String avatar;
    long creator;
    int studentNum;
    long createTime;

}
