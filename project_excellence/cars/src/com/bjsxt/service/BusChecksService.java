package com.bjsxt.service;

import com.bjsxt.pojo.BusChecks;

public interface BusChecksService {
    //添加检查单
    public int addBusCheck(BusChecks busChecks,String carnumber) throws Exception;
}
