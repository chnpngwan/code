package com.cya.dto;

public class UserLogin implements java.io.Serializable {

	// Fields

	private Integer id;  //用户编号
	private String loginName;  //用户名
	private String pwd; //密码
	private String type; //用户类型 1:管理员 2:学生
	private String mail; //邮箱

	// Constructors

	/** default constructor */
	public UserLogin() {
	}

	/** full constructor */
	public UserLogin(String loginName, String pwd, String type, String mail) {
		this.loginName = loginName;
		this.pwd = pwd;
		this.type = type;
		this.mail = mail;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getMail() {
		return this.mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

}