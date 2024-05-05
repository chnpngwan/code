package cn.service.impl;

import cn.dao.PackageDao;
import cn.dao.SpecialPackageDao;
import cn.dao.impl.PackageDaoImpl;
import cn.dao.impl.SpecialPackageDaoImpl;
import cn.pojo.SpecialPackage;
import cn.service.SpecialPackageService;

import java.util.List;

public class SpecialPackageServiceImpl implements SpecialPackageService {

    private SpecialPackageDao specialPackageDao = new SpecialPackageDaoImpl();

    @Override
    public void addSpecialPackage(SpecialPackage specialPackage) {
        specialPackageDao.addSpecialPackage(specialPackage);
    }

    @Override
    public void deleteSpecialPackageById(int special_pid) {
        specialPackageDao.deleteSpecialPackageById(special_pid);
    }

    @Override
    public void updateSpecialPackage(SpecialPackage specialPackage) {
        specialPackageDao.updateSpecialPackage(specialPackage);
    }

    @Override
    public SpecialPackage querySpecialPackageById(int special_pid) {
        return specialPackageDao.querySpecialPackageById(special_pid);
    }


    @Override
    public List<SpecialPackage> querySpecialPackages() {
        return specialPackageDao.querySpecialPackages();
    }
}
