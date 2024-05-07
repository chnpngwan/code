package com.car.model;

public class User {
	private int id;
	private String username;
	private String Userpassword;
	private String telephone;
	
	public User() {
		super();
	}

	public User(int id, String username, String userpassword, String telephone) {
		super();
		this.id = id;
		this.username = username;
		Userpassword = userpassword;
		this.telephone = telephone;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpassword() {
		return Userpassword;
	}

	public void setUserpassword(String userpassword) {
		Userpassword = userpassword;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

}
