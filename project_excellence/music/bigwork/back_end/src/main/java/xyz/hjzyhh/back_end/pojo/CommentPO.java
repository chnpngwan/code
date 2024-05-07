package xyz.hjzyhh.back_end.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("CommentPO")
public class CommentPO {
    long id;
    long uid;
    long vid;
    String content;
    long createTime;
}
