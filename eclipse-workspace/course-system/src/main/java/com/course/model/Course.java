package com.course.model;

public class Course {
	private String id          ;
	private String name        ;
	private String type        ;
	private int credit      ;
	private int class_hour  ;
	public Course() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Course(String id, String name, String type, int credit, int class_hour) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
		this.credit = credit;
		this.class_hour = class_hour;
	}
	@Override
	public String toString() {
		return "Course [id=" + id + ", name=" + name + ", type=" + type + ", credit=" + credit + ", class_hour="
				+ class_hour + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
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
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	public int getClass_hour() {
		return class_hour;
	}
	public void setClass_hour(int class_hour) {
		this.class_hour = class_hour;
	}
	
}
