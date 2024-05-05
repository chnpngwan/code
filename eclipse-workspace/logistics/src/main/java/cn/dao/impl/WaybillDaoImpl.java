package cn.dao.impl;

import cn.dao.WaybillDao;
import cn.pojo.Waybill;

import java.util.List;

public class WaybillDaoImpl extends BaseDao implements WaybillDao {
    @Override
    public int addWaybill(Waybill waybill) {
        String sql = "insert into waybill (wid,send_time,receipt_time,current_location,next_location,route,pid,sid,rid)" +
                "values(?,?,?,?,?,?,?,?,?)";
        return update(sql,waybill.getWid(),waybill.getSend_time(),waybill.getReceipt_time(),waybill.getCurrent_location(),
                waybill.getNext_location(),waybill.getRoute(),waybill.getPid(),waybill.getSid(),waybill.getRid());
    }

    @Override
    public int deleteWaybill(int wid) {
        String sql = "delete from waybill where wid = ?";
        return update(sql,wid);
    }

    @Override
    public int updateWaybill(Waybill waybill) {
        String sql = "update waybill set send_time=?,receipt_time=?,current_location=?,next_location=?,route=?," +
                "pid=?,sid=?,rid=? where wid=?";
        return update(sql,waybill.getSend_time(),waybill.getReceipt_time(),waybill.getCurrent_location(),
                waybill.getNext_location(),waybill.getRoute(),waybill.getPid(),waybill.getSid(),waybill.getRid(),waybill.getWid());
    }

    @Override
    public Waybill queryWaybillById(int wid) {
        String sql = "select wid,send_time,receipt_time,current_location,next_location,route,pid,sid,rid from waybill where wid = ?";
        return queryForOne(Waybill.class,sql,wid);
    }

    @Override
    public List<Waybill> queryWaybills() {
        String sql = "select wid,send_time,receipt_time,current_location,next_location,route,pid,sid,rid from waybill";
        return queryForList(Waybill.class,sql);
    }
}
