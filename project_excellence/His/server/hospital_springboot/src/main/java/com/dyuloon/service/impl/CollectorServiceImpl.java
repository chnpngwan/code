package com.dyuloon.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dyuloon.entity.Collector;
import com.dyuloon.entity.Patient;
import com.dyuloon.entity.customEntity.CollectorPatientPage;
import com.dyuloon.from.SearchForm;
import com.dyuloon.mapper.CollectorMapper;
import com.dyuloon.service.CollectorService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dyuloon.service.PatientService;
import com.dyuloon.util.PageVOUtil;
import com.dyuloon.vo.PageVO;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author dyuloon
 * @since 2023-06-06
 */
@Service
public class CollectorServiceImpl extends ServiceImpl<CollectorMapper, Collector> implements CollectorService {

    @Resource
    private PatientService patientService;

    @Override
    public PageVO collectorPatientPage(SearchForm searchForm) {
        Page storePage = new Page(searchForm.getPageNum(), searchForm.getPageSize());
        QueryWrapper<Collector> queryWrapper = new QueryWrapper<>();
        if(searchForm.getFlag() != null) queryWrapper.lambda().eq(Collector::getPatientId,searchForm.getFlag());
        queryWrapper.like(Strings.isNotEmpty(searchForm.getValue()), searchForm.getKey(), searchForm.getValue());
        this.baseMapper.selectPage(storePage, queryWrapper.orderByDesc("collector_id"));

        List<CollectorPatientPage> finalList = new ArrayList<>();
        List<Collector> collectorList = storePage.getRecords();
        for (int i = 0; i < collectorList.size(); i++) {
            Patient patient = this.patientService.getById(collectorList.get(i).getPatientId());
            CollectorPatientPage collectorPatientPage = new CollectorPatientPage();
            BeanUtils.copyProperties(collectorList.get(i),collectorPatientPage);
            BeanUtils.copyProperties(patient,collectorPatientPage);

            finalList.add(collectorPatientPage);
        }
        storePage.setRecords(finalList);
        PageVO pageVO = PageVOUtil.success(storePage.getRecords(), "查询成功！", storePage.getTotal(), storePage.getCurrent(), storePage.getSize());
        return pageVO;
    }
}
