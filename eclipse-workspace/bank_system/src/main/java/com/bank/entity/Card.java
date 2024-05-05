package com.bank.entity;

public class Card {
	private int id;
	private String name;
	private char sex;
	private long cardNo;
	private double balance;
	private int level;
	public Card() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Card(int id, String name, char sex, long cardNo, double balance, int level) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.cardNo = cardNo;
		this.balance = balance;
		this.level = level;
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
	public char getSex() {
		return sex;
	}
	public void setSex(char sex) {
		this.sex = sex;
	}
	public long getCardNo() {
		return cardNo;
	}
	public void setCardNo(long cardNo) {
		this.cardNo = cardNo;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	@Override
	public String toString() {
		return "Card [id=" + id + ", name=" + name + ", sex=" + sex + ", cardNo=" + cardNo + ", balance=" + balance
				+ ", level=" + level + "]";
	}
	
	

	
	
	
	
	
	

}
