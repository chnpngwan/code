package cn.service.impl;

import cn.dao.VehicleDao;
import cn.dao.impl.VehicleDaoImpl;
import cn.pojo.Vehicle;
import cn.service.VehicleService;

import java.util.List;

public class VehicleServiceImpl implements VehicleService {

    private VehicleDao vehicleDao = new VehicleDaoImpl();

    @Override
    public void addVehicle(Vehicle vehicle) {
        vehicleDao.addVehicle(vehicle);
    }

    @Override
    public void deleteVehicleById(int vid) {
        vehicleDao.deleteVehicle(vid);
    }

    @Override
    public void updateVehicle(Vehicle vehicle) {
        vehicleDao.updateVehicle(vehicle);
    }

    @Override
    public Vehicle queryVehicleById(int vid) {
        return vehicleDao.queryVehicleById(vid);
    }


    @Override
    public List<Vehicle> queryVehicles() {
        return vehicleDao.queryVehicles();
    }
}
