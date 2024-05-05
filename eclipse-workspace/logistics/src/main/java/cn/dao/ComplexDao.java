package cn.dao;

import cn.pojo.Customer;
import cn.pojo.MostPackage;

import java.util.List;

// 复合查询语句
public interface ComplexDao {

    List<MostPackage> mostPackages();

    List<MostPackage> mostCustomers();

    List<MostPackage> latePackages();

    MostPackage queryById(int wid);

}
