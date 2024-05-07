package xyz.hjzyhh.back_end.admin.PO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VideoSelector {
    Integer id;
    Boolean baned;
    Boolean show;
}
