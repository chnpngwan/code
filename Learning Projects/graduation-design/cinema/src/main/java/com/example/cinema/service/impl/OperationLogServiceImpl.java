package com.example.cinema.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.cinema.dto.OperationLogDTO;
import com.example.cinema.entity.OperationLog;
import com.example.cinema.mapper.OperationLogMapper;
import com.example.cinema.service.OperationLogService;
import com.example.cinema.utils.BeanCopyUtil;
import com.example.cinema.utils.PageUtil;
import com.example.cinema.vo.OperationLogVO;
import com.example.cinema.vo.PageResult;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OperationLogServiceImpl extends ServiceImpl<OperationLogMapper, OperationLog> implements OperationLogService {

    @Override
    public PageResult<OperationLogVO> operationLogList(OperationLogDTO operationLogDTO) {
        Page<OperationLog> page = new Page<>(PageUtil.getCurrent(), PageUtil.getSize());
        Page<OperationLog> operationLogPage = baseMapper.selectPage(page, new LambdaQueryWrapper<OperationLog>()
                .like(StringUtils.isNotBlank(operationLogDTO.getKeywords()), OperationLog::getOptModule, operationLogDTO.getKeywords())
                .or()
                .like(StringUtils.isNotBlank(operationLogDTO.getKeywords()), OperationLog::getOptDesc, operationLogDTO.getKeywords())
                .orderByDesc(OperationLog::getId));
        List<OperationLogVO> operationLogDTOList = BeanCopyUtil.copyList(operationLogPage.getRecords(), OperationLogVO.class);
        return new PageResult<>(operationLogDTOList,  operationLogPage.getTotal());
    }
}
