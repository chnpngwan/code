package com.model;

public class Cont {
	private int id;
	private String name;
	private String phone;
	private String eamli;
	private String car;
	private String message;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEamli() {
		return eamli;
	}
	public void setEamli(String eamli) {
		this.eamli = eamli;
	}
	public String getCar() {
		return car;
	}
	public void setCar(String car) {
		this.car = car;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Cont() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cont(int id, String name, String phone, String eamli, String car, String message) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.eamli = eamli;
		this.car = car;
		this.message = message;
	}
	


}
