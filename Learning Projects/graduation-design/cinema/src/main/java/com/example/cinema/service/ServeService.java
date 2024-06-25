package com.example.cinema.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.cinema.entity.Serve;
import com.example.cinema.vo.PageResult;
import com.example.cinema.vo.ServeVO;
import jdk.internal.dynalink.linker.LinkerServices;

import java.util.List;

public interface ServeService extends IService<Serve> {
    PageResult<Serve> getServePage(String keywords);
    List<ServeVO> getServeList();
}
