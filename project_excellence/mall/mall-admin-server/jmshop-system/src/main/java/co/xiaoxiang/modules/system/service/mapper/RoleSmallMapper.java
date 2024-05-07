package co.xiaoxiang.modules.system.service.mapper;

import co.xiaoxiang.modules.system.service.dto.RoleSmallDTO;
import co.xiaoxiang.base.BaseMapper;
import co.xiaoxiang.modules.system.domain.Role;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

/**
 * @author Zheng Jie
 * @date 2019-5-23
 */
@Mapper(componentModel = "spring",unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface RoleSmallMapper extends BaseMapper<RoleSmallDTO, Role> {

}
