package cn.service;

import cn.pojo.Package;
import cn.pojo.SpecialPackage;

import java.util.List;

public interface SpecialPackageService {
    public void addSpecialPackage(SpecialPackage specialPackage);

    public  void deleteSpecialPackageById(int special_pid);

    public void updateSpecialPackage(SpecialPackage specialPackage);

    public SpecialPackage querySpecialPackageById(int special_pid);

    public List<SpecialPackage> querySpecialPackages();
}
