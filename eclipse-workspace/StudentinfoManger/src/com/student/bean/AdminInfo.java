package com.student.bean;

public class AdminInfo {
	private Integer a_id;
	private String a_user;
	private String a_pwd;
	private String a_email;
	@Override
	public String toString() {
		return "AdminInfo [a_id=" + a_id + ", a_user=" + a_user + ", a_pwd=" + a_pwd + ", a_email=" + a_email + "]";
	}
	public Integer getA_id() {
		return a_id;
	}
	public void setA_id(Integer a_id) {
		this.a_id = a_id;
	}
	public String getA_pwd() {
		return a_pwd;
	}
	public void setA_pwd(String a_pwd) {
		this.a_pwd = a_pwd;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((a_email == null) ? 0 : a_email.hashCode());
		result = prime * result + ((a_id == null) ? 0 : a_id.hashCode());
		result = prime * result + ((a_pwd == null) ? 0 : a_pwd.hashCode());
		result = prime * result + ((a_user == null) ? 0 : a_user.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AdminInfo other = (AdminInfo) obj;
		if (a_email == null) {
			if (other.a_email != null)
				return false;
		} else if (!a_email.equals(other.a_email))
			return false;
		if (a_id == null) {
			if (other.a_id != null)
				return false;
		} else if (!a_id.equals(other.a_id))
			return false;
		if (a_pwd == null) {
			if (other.a_pwd != null)
				return false;
		} else if (!a_pwd.equals(other.a_pwd))
			return false;
		if (a_user == null) {
			if (other.a_user != null)
				return false;
		} else if (!a_user.equals(other.a_user))
			return false;
		return true;
	}
	public String getA_email() {
		return a_email;
	}
	public void setA_email(String a_email) {
		this.a_email = a_email;
	}
	public String getA_user() {
		return a_user;
	}
	public void setA_user(String a_user) {
		this.a_user = a_user;
	}
}
