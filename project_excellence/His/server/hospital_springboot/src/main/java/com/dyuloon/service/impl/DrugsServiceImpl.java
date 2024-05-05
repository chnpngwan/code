package com.dyuloon.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dyuloon.entity.Drugs;
import com.dyuloon.entity.Patient;
import com.dyuloon.entity.customEntity.DrugAddEntiy;
import com.dyuloon.entity.customEntity.OptionEntity;
import com.dyuloon.from.SearchForm;
import com.dyuloon.mapper.DrugsMapper;
import com.dyuloon.service.DrugsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dyuloon.util.PageVOUtil;
import com.dyuloon.util.ResultVOUtil;
import com.dyuloon.vo.PageVO;
import com.dyuloon.vo.ResultVO;
import org.apache.logging.log4j.util.Strings;
import org.springframework.stereotype.Service;

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
public class DrugsServiceImpl extends ServiceImpl<DrugsMapper, Drugs> implements DrugsService {

    @Override
    public PageVO queryPage(SearchForm searchForm) {
        Page storePage = new Page(searchForm.getPageNum(), searchForm.getPageSize());
        QueryWrapper<Drugs> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(Strings.isNotEmpty(searchForm.getValue()), searchForm.getKey(), searchForm.getValue());
        this.baseMapper.selectPage(storePage, queryWrapper.orderByDesc("drugs_id"));
        PageVO pageVO = PageVOUtil.success(storePage.getRecords(), "查询成功！", storePage.getTotal(), storePage.getCurrent(), storePage.getSize());
        return pageVO;
    }

    @Override
    public PageVO getScarceDrugs(SearchForm searchForm) {
        Page storePage = new Page(searchForm.getPageNum(), searchForm.getPageSize());
        QueryWrapper<Drugs> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(Strings.isNotEmpty(searchForm.getValue()), searchForm.getKey(), searchForm.getValue());
        queryWrapper.lambda().le(Drugs::getInventoryNum, searchForm.getFlag());
        queryWrapper.lambda().orderByDesc(Drugs::getDrugsId);
        this.baseMapper.selectPage(storePage, queryWrapper);
        PageVO pageVO = PageVOUtil.success(storePage.getRecords(), "查询成功！", storePage.getTotal(), storePage.getCurrent(), storePage.getSize());
        return pageVO;
    }

    @Override
    public ResultVO drugReplenishment(DrugAddEntiy drugAddEntiy) {
        // 查原来剩余的数量
        QueryWrapper<Drugs> qw = new QueryWrapper<>();
        qw.lambda().eq(Drugs::getDrugsId,drugAddEntiy.getDrugsId());
        Drugs drugs = this.baseMapper.selectOne(qw);
        Integer sum = drugs.getInventoryNum()+drugAddEntiy.getDrugsAddNum();
        // 更新
        UpdateWrapper<Drugs> uw = new UpdateWrapper<>();
        uw.lambda().eq(Drugs::getDrugsId,drugAddEntiy.getDrugsId()).set(Drugs::getInventoryNum,sum);
        int update = this.baseMapper.update(null,uw);
        ResultVO resultVO = update > 0 ? ResultVOUtil.success(null,"补货成功！") : ResultVOUtil.error("补货失败!");
        return resultVO;
    }

    @Override
    public ResultVO getAllDrugs() {
        List<OptionEntity> finalList = new ArrayList<>();
        List<Drugs> drugsList = this.baseMapper.selectList(null);
        for (int i = 0; i < drugsList.size(); i++) {
            OptionEntity optionEntity = new OptionEntity();
            optionEntity.setLabel(drugsList.get(i).getDrugsName());
            optionEntity.setValue(drugsList.get(i).getDrugsId());

            finalList.add(optionEntity);
        }
        ResultVO resultVO = ResultVOUtil.success(finalList,"查询成功！");
        return resultVO;
    }
}