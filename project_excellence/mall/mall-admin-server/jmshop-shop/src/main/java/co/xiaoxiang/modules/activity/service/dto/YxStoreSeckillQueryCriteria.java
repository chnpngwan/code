package co.xiaoxiang.modules.activity.service.dto;

import co.xiaoxiang.annotation.Query;
import lombok.Data;

/**
* @author xuwenbo
* @date 2019-12-14
*/
@Data
public class YxStoreSeckillQueryCriteria{

    // 模糊
    @Query(type = Query.Type.INNER_LIKE)
    private String title;
}
