package com.szpx.service.impl;

import com.szpx.entity.lishihui.Huihui;
import com.szpx.mapper.HuihuiMapper;
import com.szpx.service.HuihuiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional //事务处理策略
public class HuihuiServiceImpl implements HuihuiService {

    @Autowired
    private HuihuiMapper huihuiMapper;


    @Override
    public List<Huihui> selectAllHuihui() {
        return huihuiMapper.selectAll();
    }
}
