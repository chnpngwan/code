package com.szpx.service.impl;

import com.szpx.entity.lishihui.Huihui;
import com.szpx.entity.lishihui.TestThree;
import com.szpx.mapper.HuihuiMapper;
import com.szpx.mapper.TestThreeMapper;
import com.szpx.service.HuihuiService;
import com.szpx.service.TestThreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional //事务处理策略
public class TestThreeServiceImpl implements TestThreeService {

    @Autowired
    private TestThreeMapper testThreeMapper;

    @Override
    public List<TestThree> selectAllTestThree() {
        return testThreeMapper.selectAll();
    }



}
