package cn.service.impl;

import cn.dao.WaybillDao;
import cn.dao.impl.WaybillDaoImpl;
import cn.pojo.Vehicle;
import cn.pojo.Waybill;
import cn.service.WaybillService;

import java.util.List;

public class WaybillServiceImpl implements WaybillService {

    private WaybillDao waybillDao = new WaybillDaoImpl();

    @Override
    public void addWaybill(Waybill waybill) {
        waybillDao.addWaybill(waybill);
    }

    @Override
    public void deleteWaybillById(int wid) {
        waybillDao.deleteWaybill(wid);
    }

    @Override
    public void updateWaybill(Waybill waybill) {
        waybillDao.updateWaybill(waybill);
    }

    @Override
    public Waybill queryWaybillById(int wid) {
        return waybillDao.queryWaybillById(wid);
    }

    @Override
    public List<Waybill> queryWaybills() {
        return waybillDao.queryWaybills();
    }
}
