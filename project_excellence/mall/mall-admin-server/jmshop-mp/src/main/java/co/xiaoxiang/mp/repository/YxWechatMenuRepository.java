package co.xiaoxiang.mp.repository;


import co.xiaoxiang.mp.domain.YxWechatMenu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
* @author hupeng
* @date 2019-10-06
*/
public interface YxWechatMenuRepository extends JpaRepository<YxWechatMenu, String>, JpaSpecificationExecutor {
}
