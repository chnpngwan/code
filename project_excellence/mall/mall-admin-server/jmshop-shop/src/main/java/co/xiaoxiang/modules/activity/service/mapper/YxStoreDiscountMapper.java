package co.xiaoxiang.modules.activity.service.mapper;

import co.xiaoxiang.mapper.EntityMapper;
import co.xiaoxiang.modules.activity.domain.YxStoreDiscount;
import co.xiaoxiang.modules.activity.service.dto.YxStoreDiscountDTO;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

/**
* @author xuwenbo
* @date 2019-12-22
*/
@Mapper(componentModel = "spring",uses = {},unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface YxStoreDiscountMapper extends EntityMapper<YxStoreDiscountDTO, YxStoreDiscount> {

}
