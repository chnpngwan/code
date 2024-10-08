package co.xiaoxiang.modules.activity.repository;

import co.xiaoxiang.modules.activity.domain.YxUserExtract;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
* @author hupeng
* @date 2019-11-14
*/
public interface YxUserExtractRepository extends JpaRepository<YxUserExtract, Integer>, JpaSpecificationExecutor {
}
