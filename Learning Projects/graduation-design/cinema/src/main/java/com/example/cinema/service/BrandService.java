package com.example.cinema.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.example.cinema.entity.Brand;
import com.example.cinema.vo.BrandVO;
import com.example.cinema.vo.PageResult;

import java.util.List;

public interface BrandService extends IService<Brand> {
    PageResult<Brand> getBrandPage(String keywords);
    List<BrandVO> getBrandList();
}
