package cn.pojo;

import java.sql.Date;

public class Package {

    private int pid;

    private String pname;

    private String type;

    private double weight;

    private int number;

    private Date delivery_time;

    private String return_orNot;

    private int cid;

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getReturn_orNot() {
        return return_orNot;
    }

    public void setReturn_orNot(String return_orNo) {
        this.return_orNot = return_orNo;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public Date getDelivery_time() {
        return delivery_time;
    }

    public void setDelivery_time(Date delivery_time) {
        this.delivery_time = delivery_time;
    }

    @Override
    public String toString() {
        return "Package{" +
                "pid=" + pid +
                ", pname='" + pname + '\'' +
                ", type='" + type + '\'' +
                ", weight=" + weight +
                ", number=" + number +
                ", delivery_time=" + delivery_time +
                ", return_orNot='" + return_orNot + '\'' +
                ", cid=" + cid +
                '}';
    }
}
