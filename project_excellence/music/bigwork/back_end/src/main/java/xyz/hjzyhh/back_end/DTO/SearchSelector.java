package xyz.hjzyhh.back_end.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import xyz.hjzyhh.back_end.pojo.TagPO;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SearchSelector {
    List<String> keyword;
    String searchMod;
}
