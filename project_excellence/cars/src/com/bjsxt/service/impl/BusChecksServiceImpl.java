package com.bjsxt.service.impl;

import com.bjsxt.mapper.BusCarsMapper;
import com.bjsxt.mapper.BusChecksMapper;
import com.bjsxt.mapper.BusRentsMapper;
import com.bjsxt.pojo.BusChecks;
import com.bjsxt.pojo.BusRents;
import com.bjsxt.service.BusChecksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BusChecksServiceImpl implements BusChecksService {

    @Autowired
    BusChecksMapper busChecksMapper;
    @Autowired
    BusRentsMapper busRentsMapper;
    @Autowired
    BusCarsMapper busCarsMapper;

    @Override
    @Transactional
    public int addBusCheck(BusChecks busChecks,String carnumber) throws Exception{
        int i = 0;
        try {
            busChecksMapper.insertBusChecks(busChecks);
            busRentsMapper.updateCar(busChecks.getRentid());
            busCarsMapper.update2(carnumber);
            return 1;
        } catch (Exception e) {
            throw new Exception();
        }
    }
}
