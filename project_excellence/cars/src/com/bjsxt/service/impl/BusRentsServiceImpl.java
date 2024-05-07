package com.bjsxt.service.impl;

import com.bjsxt.mapper.BusCarsMapper;
import com.bjsxt.mapper.BusRentsMapper;
import com.bjsxt.pojo.BusCars;
import com.bjsxt.pojo.BusRents;
import com.bjsxt.pojo.Page;
import com.bjsxt.service.BusRentsService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BusRentsServiceImpl implements BusRentsService {

    @Autowired
    BusRentsMapper busRentsMapper;
    @Autowired
    BusCarsMapper busCarsMapper;

    @Override
    @Transactional
    public int addOne(BusRents busRents) throws Exception{
        try {
            //在租车数据库添加一条被租车的信息
            busRentsMapper.insertOne(busRents);
            //修改被租车辆状态
            busCarsMapper.updateCarNum(busRents.getCarnumber());
            return 1;
        } catch (Exception e) {
            throw new Exception();
        }
    }

    @Override
    public Page<BusRents> findMore(BusRents busRents) {
        List<BusRents> list = busRentsMapper.selectMore(busRents);
        Page<BusRents> pg = new Page<>();
        pg.setRows(list);
        return pg;
    }

    @Override
    public BusRents findOneBusRents(BusRents busRents) {
        List<BusRents> list = busRentsMapper.selectMore(busRents);
        if(list!=null && list.size()>0){
            return list.get(0);
        }
        return null;
    }


}
