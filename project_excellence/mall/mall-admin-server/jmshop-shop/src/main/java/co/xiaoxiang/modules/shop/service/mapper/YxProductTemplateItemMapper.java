package co.xiaoxiang.modules.shop.service.mapper;

import co.xiaoxiang.base.BaseMapper;
import co.xiaoxiang.modules.shop.domain.YxProductTemplateItem;
import co.xiaoxiang.modules.shop.service.dto.YxProductTemplateItemDto;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

/**
* @author yushen
* @date 2023-05-11
*/
@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface YxProductTemplateItemMapper extends BaseMapper<YxProductTemplateItemDto, YxProductTemplateItem> {

}
