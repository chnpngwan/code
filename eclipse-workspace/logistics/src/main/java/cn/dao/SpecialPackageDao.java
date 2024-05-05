package cn.dao;

import cn.pojo.Package;
import cn.pojo.SpecialPackage;

import java.util.List;

public interface SpecialPackageDao {
    public int addSpecialPackage(SpecialPackage specialPackage);

    public int deleteSpecialPackageById(int special_pid);

    public int updateSpecialPackage(SpecialPackage specialPackage);

    public SpecialPackage querySpecialPackageById(int special_pid);

    public List<SpecialPackage> querySpecialPackages();
}
