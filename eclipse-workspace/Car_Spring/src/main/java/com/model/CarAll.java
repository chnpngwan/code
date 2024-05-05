package com.model;

public class CarAll {
	private int id;
    private String img;
    private String carName;
    private String price;
    private String type;
	public CarAll(int id, String img, String carName, String price, String type) {
		super();
		this.id = id;
		this.img = img;
		this.carName = carName;
		this.price = price;
		this.type = type;
	}
	public CarAll() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
