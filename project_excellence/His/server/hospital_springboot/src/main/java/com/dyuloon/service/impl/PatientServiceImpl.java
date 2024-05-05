package com.dyuloon.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dyuloon.entity.Collector;
import com.dyuloon.entity.Doctor;
import com.dyuloon.entity.Patient;
import com.dyuloon.from.SearchForm;
import com.dyuloon.mapper.PatientMapper;
import com.dyuloon.service.PatientService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dyuloon.util.PageVOUtil;
import com.dyuloon.vo.PageVO;
import org.apache.logging.log4j.util.Strings;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author dyuloon
 * @since 2023-06-06
 */
@Service
public class PatientServiceImpl extends ServiceImpl<PatientMapper, Patient> implements PatientService {

    @Override
    public PageVO queryPage(SearchForm searchForm) {
        Page storePage = new Page(searchForm.getPageNum(), searchForm.getPageSize());
        QueryWrapper<Patient> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(Strings.isNotEmpty(searchForm.getValue()), searchForm.getKey(), searchForm.getValue());
        this.baseMapper.selectPage(storePage, queryWrapper.orderByDesc("patient_id"));
        PageVO pageVO = PageVOUtil.success(storePage.getRecords(), "查询成功！", storePage.getTotal(), storePage.getCurrent(), storePage.getSize());
        return pageVO;
    }
}
