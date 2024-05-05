package cn.service.impl;

import cn.dao.PackageDao;
import cn.dao.impl.PackageDaoImpl;
import cn.pojo.Package;
import cn.service.PackageService;

import java.util.List;

public class PackageServiceImpl implements PackageService {

    private PackageDao packageDao = new PackageDaoImpl();

    @Override
    public void addPackage(Package _package) {
        packageDao.addPackage(_package);
    }

    @Override
    public void deletePackageById(int pid) {
        packageDao.deletePackage(pid);
    }

    @Override
    public void updatePackage(Package _package) {
        packageDao.updatePackage(_package);
    }

    @Override
    public Package queryPackageById(int pid) {
        return packageDao.queryPackageById(pid);
    }

    @Override
    public List<Package> queryPackages() {
        return packageDao.queryPackages();
    }
}
