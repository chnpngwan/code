package com.source.entity;

import java.util.Date;

public class Source {
	private int id;
	private String name;
	private String type;
	private Date buyDate;
	private int price;
	public Source() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Source(int id, String name, String type, Date buyDate, int price) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
		this.buyDate = buyDate;
		this.price = price;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Source [id=" + id + ", name=" + name + ", type=" + type + ", buyDate=" + buyDate + ", price=" + price
				+ "]";
	}
	
	

}
