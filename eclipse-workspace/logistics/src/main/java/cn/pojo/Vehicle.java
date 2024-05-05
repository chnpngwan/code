package cn.pojo;

public class Vehicle {
    private int vid;

    private String vehicle_model;

    private double money;

    public int getVid() {
        return vid;
    }

    public void setVid(int vid) {
        this.vid = vid;
    }

    public String getVehicle_model() {
        return vehicle_model;
    }

    public void setVehicle_model(String vehicle_model) {
        this.vehicle_model = vehicle_model;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    @Override
    public String toString() {
        return "Vehicle{" +
                "vid='" + vid + '\'' +
                ", vehicle_model='" + vehicle_model + '\'' +
                ", money=" + money +
                '}';
    }
}
