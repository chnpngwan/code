package cn.pojo;

import java.sql.Date;
import java.sql.Timestamp;

public class Waybill {

    private int wid;

    private Date send_time;

    private Date receipt_time;

    private String current_location;

    private String next_location;

    private String route;

    private int pid;

    private int sid;

    private int rid;

    public Waybill() {
    }

    public Waybill(int wid, Date send_time, Date receipt_time, String current_location, String next_location, String route, int pid, int sid,int rid) {
        this.wid = wid;
        this.send_time = send_time;
        this.receipt_time = receipt_time;
        this.current_location = current_location;
        this.next_location = next_location;
        this.route = route;
        this.pid = pid;
        this.sid = sid;
        this.rid = rid;
    }

    public int getWid() {
        return wid;
    }

    public void setWid(int wid) {
        this.wid = wid;
    }

    public Date getSend_time() {
        return send_time;
    }

    public void setSend_time(Date send_time) {
        this.send_time = send_time;
    }

    public Date getReceipt_time() {
        return receipt_time;
    }

    public void setReceipt_time(Date receipt_time) {
        this.receipt_time = receipt_time;
    }

    public String getCurrent_location() {
        return current_location;
    }

    public void setCurrent_location(String current_location) {
        this.current_location = current_location;
    }

    public String getNext_location() {
        return next_location;
    }

    public void setNext_location(String next_location) {
        this.next_location = next_location;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    @Override
    public String toString() {
        return "Waybill{" +
                "wid=" + wid +
                ", send_time=" + send_time +
                ", receipt_time=" + receipt_time +
                ", current_location='" + current_location + '\'' +
                ", next_location='" + next_location + '\'' +
                ", route='" + route + '\'' +
                ", pid=" + pid +
                ", sid=" + sid +
                ", rid=" + rid +
                '}';
    }
}
