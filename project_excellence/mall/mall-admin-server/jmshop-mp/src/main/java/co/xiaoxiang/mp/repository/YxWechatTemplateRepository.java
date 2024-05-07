package co.xiaoxiang.mp.repository;

import co.xiaoxiang.mp.domain.YxWechatTemplate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
* @author xuwenbo
* @date 2019-12-10
*/
public interface YxWechatTemplateRepository extends JpaRepository<YxWechatTemplate, Integer>, JpaSpecificationExecutor {
    YxWechatTemplate findByTempkey(String key);
}
