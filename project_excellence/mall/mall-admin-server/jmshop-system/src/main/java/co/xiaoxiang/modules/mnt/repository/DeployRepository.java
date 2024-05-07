package co.xiaoxiang.modules.mnt.repository;

import co.xiaoxiang.modules.mnt.domain.Deploy;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
* @author zhanghouying
* @date 2019-08-24
*/
public interface DeployRepository extends JpaRepository<Deploy, Long>, JpaSpecificationExecutor<Deploy> {
}
