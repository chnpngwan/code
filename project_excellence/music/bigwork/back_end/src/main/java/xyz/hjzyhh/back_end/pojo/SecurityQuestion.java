package xyz.hjzyhh.back_end.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Alias("SecurityQuestion")
public class SecurityQuestion {
    private long userId;
    private String username;
    private String question;
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private String answer;

    // 省略构造函数、getter和setter等
}
