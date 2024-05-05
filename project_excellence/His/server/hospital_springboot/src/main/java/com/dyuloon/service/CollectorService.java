package com.dyuloon.service;

import com.dyuloon.entity.Collector;
import com.baomidou.mybatisplus.extension.service.IService;
import com.dyuloon.from.SearchForm;
import com.dyuloon.vo.PageVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author dyuloon
 * @since 2023-06-06
 */
public interface CollectorService extends IService<Collector> {

    PageVO collectorPatientPage(SearchForm searchForm);
}
