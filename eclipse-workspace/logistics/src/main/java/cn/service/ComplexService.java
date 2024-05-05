package cn.service;

import cn.dao.ComplexDao;
import cn.dao.impl.ComplexDaoImpl;
import cn.pojo.Customer;
import cn.pojo.MostPackage;

import java.util.List;

public interface ComplexService {

    public List<MostPackage> mostPackages();

    public List<MostPackage> mostCustomers();

    public List<MostPackage> latePackages();

    public MostPackage queryById(int wid);

}
