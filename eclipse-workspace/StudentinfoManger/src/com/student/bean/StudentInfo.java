package com.student.bean;

public class StudentInfo {
	private Integer s_id; 
	private String s_name;
	private String s_tel;
	private String s_mail;
	private String s_card;
	private String s_sex;
	private String s_pwd;
	@Override
	public String toString() {
		return "student [s_id=" + s_id + ", s_name=" + s_name + ", s_tel=" + s_tel + ", s_mail=" + s_mail + ", s_card="
				+ s_card + ", s_sex=" + s_sex + ", s_pwd=" + s_pwd + "]";
	}
	public Integer getS_id() {
		return s_id;
	}
	public void setS_id(Integer s_id) {
		this.s_id = s_id;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_tel() {
		return s_tel;
	}
	public void setS_tel(String s_tel) {
		this.s_tel = s_tel;
	}
	public String getS_mail() {
		return s_mail;
	}
	public void setS_mail(String s_mail) {
		this.s_mail = s_mail;
	}
	public String getS_card() {
		return s_card;
	}
	public void setS_card(String s_card) {
		this.s_card = s_card;
	}
	public String getS_sex() {
		return s_sex;
	}
	public void setS_sex(String s_sex) {
		this.s_sex = s_sex;
	}
	public String getS_pwd() {
		return s_pwd;
	}
	public void setS_pwd(String s_pwd) {
		this.s_pwd = s_pwd;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((s_card == null) ? 0 : s_card.hashCode());
		result = prime * result + ((s_id == null) ? 0 : s_id.hashCode());
		result = prime * result + ((s_mail == null) ? 0 : s_mail.hashCode());
		result = prime * result + ((s_name == null) ? 0 : s_name.hashCode());
		result = prime * result + ((s_pwd == null) ? 0 : s_pwd.hashCode());
		result = prime * result + ((s_sex == null) ? 0 : s_sex.hashCode());
		result = prime * result + ((s_tel == null) ? 0 : s_tel.hashCode());
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
		StudentInfo other = (StudentInfo) obj;
		if (s_card == null) {
			if (other.s_card != null)
				return false;
		} else if (!s_card.equals(other.s_card))
			return false;
		if (s_id == null) {
			if (other.s_id != null)
				return false;
		} else if (!s_id.equals(other.s_id))
			return false;
		if (s_mail == null) {
			if (other.s_mail != null)
				return false;
		} else if (!s_mail.equals(other.s_mail))
			return false;
		if (s_name == null) {
			if (other.s_name != null)
				return false;
		} else if (!s_name.equals(other.s_name))
			return false;
		if (s_pwd == null) {
			if (other.s_pwd != null)
				return false;
		} else if (!s_pwd.equals(other.s_pwd))
			return false;
		if (s_sex == null) {
			if (other.s_sex != null)
				return false;
		} else if (!s_sex.equals(other.s_sex))
			return false;
		if (s_tel == null) {
			if (other.s_tel != null)
				return false;
		} else if (!s_tel.equals(other.s_tel))
			return false;
		return true;
	}
}
