package com.dyuloon.service;

import com.dyuloon.entity.Doctor;
import com.baomidou.mybatisplus.extension.service.IService;
import com.dyuloon.entity.customEntity.UpdateDoctorDepartmentEntity;
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
public interface DoctorService extends IService<Doctor> {

    PageVO queryPage(SearchForm searchForm);

    PageVO queryOneDepartment(SearchForm searchForm);

    ResultVO updateDoctorDepartment(UpdateDoctorDepartmentEntity updateDoctorDepartmentEntity);
}
