package com.bjsxt.service.impl;

import com.bjsxt.mapper.BusCarsMapper;
import com.bjsxt.pojo.BusCars;
import com.bjsxt.pojo.Page;
import com.bjsxt.service.BusCarsService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BusCarsServiceImpl implements BusCarsService {

    @Autowired
    BusCarsMapper busCarsMapper;

    @Override
    public Page<BusCars> findAll(int page, int rows) {
        /*List<BusCars> list = busCarsMapper.selectAll((page - 1) * rows, rows);
        int count = busCarsMapper.getCount();
        Page<BusCars> p = new Page<>(list,count);*/

        //进行分页设置
        com.github.pagehelper.Page page1 = PageHelper.startPage(page, rows);
        //获取总条数
        long total = page1.getTotal();
        List<BusCars> list = busCarsMapper.selectAll();
        Page<BusCars> pg = new Page<>(list,total);
        return pg;
    }

    @Override
    public int addCars(BusCars busCars) {
        return busCarsMapper.addCars(busCars);
    }

    @Override
    public int changeCars(BusCars busCars) {
        return busCarsMapper.update(busCars);
    }

    @Override
    public int remove(String carnumber) {
        return busCarsMapper.delete(carnumber);
    }

    @Override
    public List<BusCars> findIsRenting() {
        return busCarsMapper.selectIsRenting();
    }

    @Override
    public BusCars findOne(String carnumber) {
        return busCarsMapper.selectOne(carnumber);
    }
}
