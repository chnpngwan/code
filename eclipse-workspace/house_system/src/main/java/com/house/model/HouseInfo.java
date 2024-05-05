package com.house.model;

import java.util.Date;

public class HouseInfo {
	private int id;
	private String location;
	private Double area;
	private String address;
	private String type;
	private String mobile;
	private Date registerTime;
	public HouseInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HouseInfo(int id, String location, Double area, String address, String type, String mobile, Date registerTime) {
		super();
		this.id = id;
		this.location = location;
		this.area = area;
		this.address = address;
		this.type = type;
		this.mobile = mobile;
		this.registerTime = registerTime;
	}
	@Override
	public String toString() {
		return "House [id=" + id + ", location=" + location + ", area=" + area + ", address=" + address + ", type="
				+ type + ", mobile=" + mobile + ", registerTime=" + registerTime + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Double getArea() {
		return area;
	}
	public void setArea(Double area) {
		this.area = area;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}
	
}
