package cn.dao;

import cn.pojo.Staff;
import cn.pojo.Vehicle;

import java.util.List;

public interface VehicleDao {
    public int addVehicle(Vehicle vehicle);

    public int deleteVehicle(int vid);

    public int updateVehicle(Vehicle vehicle);

    public Vehicle queryVehicleById(int vid);

    public List<Vehicle> queryVehicles();
}
