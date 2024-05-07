package co.xiaoxiang.modules.activity.service.dto;

import co.xiaoxiang.annotation.Query;
import lombok.Data;

/**
* @author hupeng
* @date 2019-11-10
*/
@Data
public class YxStoreCouponUserQueryCriteria{

    // 模糊
    @Query(type = Query.Type.INNER_LIKE)
    private String couponTitle;

    @Query
    private Integer status;
    @Query
    private String remindFlag;

}