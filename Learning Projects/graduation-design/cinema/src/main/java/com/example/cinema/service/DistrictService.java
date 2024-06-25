package com.example.cinema.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.cinema.entity.District;
import com.example.cinema.vo.DistrictVO;
import com.example.cinema.vo.PageResult;

import java.util.List;


public interface DistrictService extends IService<District> {
    PageResult<District> getDistrictPage(String keywords);
    List<DistrictVO> getDistrictList();
}
