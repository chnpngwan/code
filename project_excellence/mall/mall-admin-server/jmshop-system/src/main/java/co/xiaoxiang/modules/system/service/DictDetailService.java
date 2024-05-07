package co.xiaoxiang.modules.system.service;

import co.xiaoxiang.modules.system.domain.DictDetail;
import co.xiaoxiang.modules.system.service.dto.DictDetailDTO;
import co.xiaoxiang.modules.system.service.dto.DictDetailQueryCriteria;
import org.springframework.data.domain.Pageable;
import java.util.Map;

/**
* @author Zheng Jie
* @date 2019-04-10
*/
public interface DictDetailService {

    /**
     * 根据ID查询
     * @param id /
     * @return /
     */
    DictDetailDTO findById(Long id);

    /**
     * 创建
     * @param resources /
     * @return /
     */
    DictDetailDTO create(DictDetail resources);

    /**
     * 编辑
     * @param resources /
     */
    void update(DictDetail resources);

    /**
     * 删除
     * @param id /
     */
    void delete(Long id);

    /**
     * 分页查询
     * @param criteria 条件
     * @param pageable 分页参数
     * @return /
     */
    Map<String,Object> queryAll(DictDetailQueryCriteria criteria, Pageable pageable);
}
