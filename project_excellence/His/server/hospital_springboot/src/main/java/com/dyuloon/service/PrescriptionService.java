package com.dyuloon.service;

import com.dyuloon.entity.Patient;
import com.dyuloon.entity.Prescription;
import com.baomidou.mybatisplus.extension.service.IService;
import com.dyuloon.from.PrescriptionForm;
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
public interface PrescriptionService extends IService<Prescription> {

    ResultVO savePrescription(PrescriptionForm prescriptionForm);

    PageVO queryPage(SearchForm searchForm);

    ResultVO deleteCaseById(Integer id);

    ResultVO getDrugById(Integer id);

    PageVO queryPatientCasePage(SearchForm searchForm);

    PageVO queryPatientPayPage(SearchForm searchForm);

    PageVO queryAdminUnpayPage(SearchForm searchForm);
}
