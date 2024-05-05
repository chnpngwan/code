package cn.dao;

import cn.pojo.SpecialPackage;
import cn.pojo.Waybill;

import java.util.List;

public interface WaybillDao {
    public int addWaybill(Waybill waybill);

    public int deleteWaybill(int wid);

    public int updateWaybill(Waybill waybill);

    public Waybill queryWaybillById(int wid);

    public List<Waybill> queryWaybills();
}
