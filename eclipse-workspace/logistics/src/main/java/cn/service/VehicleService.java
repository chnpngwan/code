package cn.service;

import cn.pojo.Staff;
import cn.pojo.Vehicle;

import java.util.List;

public interface VehicleService {
    public void addVehicle(Vehicle vehicle);

    public void deleteVehicleById(int vid);

    public void updateVehicle(Vehicle Vehicle);

    public Vehicle queryVehicleById(int vid);

    public List<Vehicle> queryVehicles();
}
