package cn.dao.impl;

import cn.dao.PackageDao;
import cn.pojo.Package;

import java.util.List;

public class PackageDaoImpl extends BaseDao implements PackageDao {

    @Override
    public int addPackage(Package _package) {
        String sql = "insert into package(pid,pname,type,weight,number,delivery_time,return_orNot,cid) values (?,?,?,?,?,?,?,?)";
        return update(sql,_package.getPid(),_package.getPname(),_package.getType(),_package.getWeight(),_package.getNumber(),
                _package.getDelivery_time(),_package.getReturn_orNot(),_package.getCid());
    }

    @Override
    public int deletePackage(int pid) {
        String sql = "delete from package where pid = ?";
        return update(sql,pid);
    }

    @Override
    public int updatePackage(Package _package) {
        String sql = "update package set pname=?,type=?,weight=?,number=?,delivery_time=?,return_orNot=?,cid=? where pid=?";
        return update(sql,_package.getPname(),_package.getType(),_package.getWeight(),_package.getNumber(),
                _package.getDelivery_time(),_package.getReturn_orNot(),_package.getCid(),_package.getPid());
    }

    @Override
    public Package queryPackageById(int pid) {
        String sql = "select pid,pname,type,weight,number,delivery_time,return_orNot,cid from package where pid = ?";
        return queryForOne(Package.class,sql,pid);
    }


    @Override
    public List<Package> queryPackages() {
        String sql = "select pid,pname,type,weight,number,delivery_time,return_orNot,cid from package";
        return queryForList(Package.class,sql);
    }
}
