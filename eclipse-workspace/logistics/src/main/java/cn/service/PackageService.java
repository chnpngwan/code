package cn.service;

import cn.pojo.Package;

import java.util.List;

public interface PackageService {

    public void addPackage(Package _package);

    public void deletePackageById(int pid);

    public void updatePackage(Package _package);

    public Package queryPackageById(int pid);

    public List<Package> queryPackages();

}
