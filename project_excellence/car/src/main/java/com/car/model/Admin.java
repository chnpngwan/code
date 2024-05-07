package com.car.model;

public class Admin {
	private int id;
	private String password;
	private String username;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Admin(int id, String password, String username) {
		super();
		this.id = id;
		this.password = password;
		this.username = username;
	}
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
}
