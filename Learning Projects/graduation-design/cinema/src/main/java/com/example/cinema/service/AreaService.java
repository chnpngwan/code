package com.example.cinema.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.cinema.entity.Area;
import com.example.cinema.vo.PageResult;

public interface AreaService extends IService<Area> {
    PageResult<Area> getAreaPage(String keywords);
}
