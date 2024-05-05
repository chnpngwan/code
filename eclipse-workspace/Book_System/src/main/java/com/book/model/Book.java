package com.book.model;

import java.io.Serializable;

public class Book implements Serializable{
	private int id;
	private String name;
	private String press;
	private String author;
	private double price;
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Book(int id, String name, String press, String author, double price) {
		super();
		this.id = id;
		this.name = name;
		this.press = press;
		this.author = author;
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
	public String getPress() {
		return press;
	}
	public void setPress(String press) {
		this.press = press;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Book [id=" + id + ", name=" + name + ", press=" + press + ", author=" + author + ", price=" + price
				+ "]";
	}
	


}
