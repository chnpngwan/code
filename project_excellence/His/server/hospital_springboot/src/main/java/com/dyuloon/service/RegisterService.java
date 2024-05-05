package com.dyuloon.service;

import com.dyuloon.entity.Register;
import com.baomidou.mybatisplus.extension.service.IService;
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
public interface RegisterService extends IService<Register> {

    PageVO queryPage(SearchForm searchForm);

    ResultVO findDoctor(Integer id);

    PageVO queryDoctorPage(SearchForm searchForm);

    ResultVO stateChange(Integer id);

    PageVO queryPrescriptionPage(SearchForm searchForm);
}
