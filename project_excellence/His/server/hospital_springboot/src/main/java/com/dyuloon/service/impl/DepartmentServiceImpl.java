package com.dyuloon.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dyuloon.entity.Collector;
import com.dyuloon.entity.Department;
import com.dyuloon.entity.customEntity.OptionEntity;
import com.dyuloon.from.SearchForm;
import com.dyuloon.mapper.DepartmentMapper;
import com.dyuloon.service.DepartmentService;
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
public class DepartmentServiceImpl extends ServiceImpl<DepartmentMapper, Department> implements DepartmentService {

    // 分页查找
    @Override
    public PageVO queryPage(SearchForm searchForm) {
        System.out.println(searchForm);
        Page storePage = new Page(searchForm.getPageNum(), searchForm.getPageSize());
        QueryWrapper<Department> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(Strings.isNotEmpty(searchForm.getValue()), searchForm.getKey(), searchForm.getValue());
        this.baseMapper.selectPage(storePage, queryWrapper.orderByDesc("department_id"));
        PageVO pageVO = PageVOUtil.success(storePage.getRecords(), "查询成功！", storePage.getTotal(), storePage.getCurrent(), storePage.getSize());
        return pageVO;
    }

//    查全部科室
    @Override
    public ResultVO getlist() {
        List<Department> departmentList = this.baseMapper.selectList(null);
        List<OptionEntity> finalList = new ArrayList<>();
        // 重拼数组
        for (int i = 0; i < departmentList.size(); i++) {
            OptionEntity optionEntity = new OptionEntity();
            optionEntity.setLabel(departmentList.get(i).getDepartmentName());
            optionEntity.setValue(departmentList.get(i).getDepartmentId());
            finalList.add(optionEntity);
        }
        ResultVO resultVO = ResultVOUtil.success(finalList,"查找成功！");
        return resultVO;
    }
}
