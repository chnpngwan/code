package cn.dao;

import cn.pojo.Package;

import java.util.List;

public interface PackageDao {

    public int addPackage(Package _package);

    public int deletePackage(int pid);

    public int updatePackage(Package _package);

    public Package queryPackageById(int pid);

    public List<Package> queryPackages();

}
