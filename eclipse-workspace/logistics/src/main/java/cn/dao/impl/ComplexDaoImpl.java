package cn.dao.impl;

import cn.dao.ComplexDao;
import cn.pojo.Customer;
import cn.pojo.MostPackage;

import java.util.List;

public class ComplexDaoImpl extends BaseDao implements ComplexDao {
    @Override
    public List<MostPackage> mostPackages() {
        String sql = "SELECT cid,cname,COUNT(*) AS number " +
                "                FROM package NATURAL JOIN customer " +
                "                GROUP BY cid LIMIT 1";
        return queryForList(MostPackage.class,sql);
    }

    @Override
    public List<MostPackage> mostCustomers() {
        String sql = "SELECT address,COUNT(*) AS number " +
                "FROM customer " +
                "GROUP BY address " +
                "ORDER BY number DESC LIMIT 1";
         return queryForList(MostPackage.class,sql);
    }

    @Override
    public List<MostPackage> latePackages() {
        String sql = "SELECT wid,delivery_time,send_time,receipt_time,current_location,next_location,route,pid,sid,rid " +
                "FROM package NATURAL JOIN waybill " +
                "WHERE delivery_time<receipt_time";
        return queryForList(MostPackage.class,sql);
    }

    @Override
    public MostPackage queryById(int wid) {
        String sql = "SELECT wid,delivery_time,send_time,receipt_time,current_location,next_location,route,pid,sid,rid " +
                "FROM package NATURAL JOIN waybill " +
                "WHERE wid = ?";
        return queryForOne(MostPackage.class,sql,wid);
    }
}
