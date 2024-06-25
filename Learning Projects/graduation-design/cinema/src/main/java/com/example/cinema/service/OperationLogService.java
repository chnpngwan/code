package com.example.cinema.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.example.cinema.dto.OperationLogDTO;
import com.example.cinema.entity.OperationLog;
import com.example.cinema.vo.OperationLogVO;
import com.example.cinema.vo.PageResult;


public interface OperationLogService extends IService<OperationLog> {
    PageResult<OperationLogVO> operationLogList(OperationLogDTO operationLogDTO);
}
