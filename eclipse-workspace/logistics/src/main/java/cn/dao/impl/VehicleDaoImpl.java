package cn.dao.impl;

import cn.dao.VehicleDao;
import cn.pojo.Vehicle;

import java.util.List;

public class VehicleDaoImpl extends BaseDao implements VehicleDao {
    @Override
    public int addVehicle(Vehicle vehicle) {
        String sql = "insert into vehicle (vid,vehicle_model,money) values(?,?,?)";
        return update(sql,vehicle.getVid(),vehicle.getVehicle_model(),vehicle.getMoney());
    }

    @Override
    public int deleteVehicle(int vid) {
        String sql = "delete from vehicle where vid = ?";
        return update(sql,vid);
    }

    @Override
    public int updateVehicle(Vehicle vehicle) {
        String sql = "update vehicle set vehicle_model = ?,money = ? where vid = ?";
        return update(sql,vehicle.getVehicle_model(),vehicle.getMoney(),vehicle.getVid());
    }

    @Override
    public Vehicle queryVehicleById(int vid) {
        String sql = "select vid,vehicle_model,money from vehicle where vid = ?";
        return queryForOne(Vehicle.class,sql,vid);
    }

    @Override
    public List<Vehicle> queryVehicles() {
        String sql = "select vid,vehicle_model,money from vehicle";
        return queryForList(Vehicle.class,sql);
    }
}
