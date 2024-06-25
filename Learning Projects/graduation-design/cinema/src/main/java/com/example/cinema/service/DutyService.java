package com.example.cinema.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.cinema.entity.Duty;
import com.example.cinema.vo.PageResult;

public interface DutyService extends IService<Duty> {
    PageResult<Duty> getDutyPage(String keywords);
}
