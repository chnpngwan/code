package cn.service.impl;

import cn.dao.ComplexDao;
import cn.dao.impl.ComplexDaoImpl;
import cn.pojo.Customer;
import cn.pojo.MostPackage;
import cn.service.ComplexService;

import java.util.List;

public class ComplexServiceImpl implements ComplexService {

    public ComplexDao complexDao = new ComplexDaoImpl();

    @Override
    public List<MostPackage> mostPackages() {
        return complexDao.mostPackages();
    }

    @Override
    public List<MostPackage> mostCustomers() {
        return complexDao.mostCustomers();
    }

    @Override
    public List<MostPackage> latePackages() {
        return complexDao.latePackages();
    }

    @Override
    public MostPackage queryById(int wid) {
        return complexDao.queryById(wid);
    }
}
