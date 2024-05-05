package com.dyuloon.service;

import com.dyuloon.entity.Drugs;
import com.baomidou.mybatisplus.extension.service.IService;
import com.dyuloon.entity.customEntity.DrugAddEntiy;
import com.dyuloon.from.SearchForm;
import com.dyuloon.vo.PageVO;
import com.dyuloon.vo.ResultVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author dyuloon
 * @since 2023-06-06
 */
public interface DrugsService extends IService<Drugs> {

    PageVO queryPage(SearchForm searchForm);

    PageVO getScarceDrugs(SearchForm searchForm);

    ResultVO drugReplenishment(DrugAddEntiy drugAddEntiy);

    ResultVO getAllDrugs();
}
