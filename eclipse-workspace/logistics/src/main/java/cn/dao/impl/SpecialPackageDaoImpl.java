package cn.dao.impl;

import cn.dao.SpecialPackageDao;
import cn.pojo.Package;
import cn.pojo.SpecialPackage;

import java.util.List;

public class SpecialPackageDaoImpl extends BaseDao implements SpecialPackageDao {

    /**
     * 出错
     * @param specialPackage
     * @return
     */
    @Override
    public int addSpecialPackage(SpecialPackage specialPackage) {
        String sql = "insert into special_package (special_pid,pname,type,weight,number,delivery_time,return_orNot,cid,danger,value) " +
                "values (?,?,?,?,?,?,?,?,?,?)";
        return update(sql,specialPackage.getSpecial_pid(),specialPackage.getPname(),specialPackage.getType(),specialPackage.getWeight(),
                specialPackage.getNumber(),specialPackage.getDelivery_time(),specialPackage.getReturn_orNot(),specialPackage.getCid(),specialPackage.getDanger(),specialPackage.getValue());
    }

    @Override
    public int deleteSpecialPackageById(int special_pid) {
        String sql = "delete from special_package where special_pid = ?";
        return update(sql,special_pid);
    }

    @Override
    public int updateSpecialPackage(SpecialPackage specialPackage) {
        String sql = "update special_package set pname=?,type=?,weight=?,number=?,delivery_time=?,return_orNot=?,cid=?," +
                "danger=?,value=? where special_pid=?";
        return update(sql,specialPackage.getPname(),specialPackage.getType(),specialPackage.getWeight(),
                specialPackage.getNumber(),specialPackage.getDelivery_time(),specialPackage.getReturn_orNot(),specialPackage.getCid(),specialPackage.getDanger(),
                specialPackage.getValue(),specialPackage.getSpecial_pid());
    }

    @Override
    public SpecialPackage querySpecialPackageById(int special_pid) {
        String sql = "select special_pid,pname,type,weight,number,delivery_time,return_orNot,cid,danger,value from special_package where special_pid=?";
        return queryForOne(SpecialPackage.class,sql,special_pid);
    }

    @Override
    public List<SpecialPackage> querySpecialPackages() {
        String sql = "select special_pid,pname,type,weight,number,delivery_time,return_orNot,cid,danger,value from special_package";
        return queryForList(SpecialPackage.class,sql);
    }
}
