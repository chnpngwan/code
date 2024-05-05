package cn.service;

import cn.pojo.Vehicle;
import cn.pojo.Waybill;

import java.util.List;

public interface WaybillService {
    public void addWaybill(Waybill waybill);

    public void deleteWaybillById(int wid);

    public void updateWaybill(Waybill waybill);

    public Waybill queryWaybillById(int wid);

    public List<Waybill> queryWaybills();
}
