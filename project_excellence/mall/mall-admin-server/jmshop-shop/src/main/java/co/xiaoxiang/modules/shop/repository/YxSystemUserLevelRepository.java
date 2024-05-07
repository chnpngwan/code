package co.xiaoxiang.modules.shop.repository;

import co.xiaoxiang.modules.shop.domain.YxSystemUserLevel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
* @author hupeng
* @date 2019-12-04
*/
public interface YxSystemUserLevelRepository extends JpaRepository<YxSystemUserLevel, Integer>, JpaSpecificationExecutor {
}