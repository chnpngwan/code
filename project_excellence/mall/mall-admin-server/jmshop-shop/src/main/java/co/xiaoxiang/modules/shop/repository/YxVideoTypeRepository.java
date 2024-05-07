package co.xiaoxiang.modules.shop.repository;

import co.xiaoxiang.modules.shop.domain.YxVideoType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
* @author yushen
* @date 2023-06-08
*/
public interface YxVideoTypeRepository extends JpaRepository<YxVideoType, Integer>, JpaSpecificationExecutor<YxVideoType> {
}
