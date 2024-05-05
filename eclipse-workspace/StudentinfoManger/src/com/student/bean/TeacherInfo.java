package com.student.bean;

public class TeacherInfo {
	private Integer t_id;
	private String t_name;
	private String t_tel;
	private String t_mail;
	private String t_card;
	private String t_sex;
	private String t_pwd;
	private String dapart;
	private String prof;
	@Override
	public String toString() {
		return "TeacherInfo [t_id=" + t_id + ", t_name=" + t_name + ", t_tel=" + t_tel + ", t_mail=" + t_mail
				+ ", t_card=" + t_card + ", t_sex=" + t_sex + ", t_pwd=" + t_pwd + ", dapart=" + dapart + ", prof="
				+ prof + "]";
	}
	public Integer getT_id() {
		return t_id;
	}
	public void setT_id(Integer t_id) {
		this.t_id = t_id;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getT_sex() {
		return t_sex;
	}
	public void setT_sex(String t_sex) {
		this.t_sex = t_sex;
	}
	public String getT_pwd() {
		return t_pwd;
	}
	public void setT_pwd(String t_pwd) {
		this.t_pwd = t_pwd;
	}
	public String getDapart() {
		return dapart;
	}
	public void setDapart(String dapart) {
		this.dapart = dapart;
	}
	public String getProf() {
		return prof;
	}
	public void setProf(String prof) {
		this.prof = prof;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((dapart == null) ? 0 : dapart.hashCode());
		result = prime * result + ((prof == null) ? 0 : prof.hashCode());
		result = prime * result + ((t_card == null) ? 0 : t_card.hashCode());
		result = prime * result + ((t_id == null) ? 0 : t_id.hashCode());
		result = prime * result + ((t_mail == null) ? 0 : t_mail.hashCode());
		result = prime * result + ((t_name == null) ? 0 : t_name.hashCode());
		result = prime * result + ((t_pwd == null) ? 0 : t_pwd.hashCode());
		result = prime * result + ((t_sex == null) ? 0 : t_sex.hashCode());
		result = prime * result + ((t_tel == null) ? 0 : t_tel.hashCode());
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
		TeacherInfo other = (TeacherInfo) obj;
		if (dapart == null) {
			if (other.dapart != null)
				return false;
		} else if (!dapart.equals(other.dapart))
			return false;
		if (prof == null) {
			if (other.prof != null)
				return false;
		} else if (!prof.equals(other.prof))
			return false;
		if (t_card == null) {
			if (other.t_card != null)
				return false;
		} else if (!t_card.equals(other.t_card))
			return false;
		if (t_id == null) {
			if (other.t_id != null)
				return false;
		} else if (!t_id.equals(other.t_id))
			return false;
		if (t_mail == null) {
			if (other.t_mail != null)
				return false;
		} else if (!t_mail.equals(other.t_mail))
			return false;
		if (t_name == null) {
			if (other.t_name != null)
				return false;
		} else if (!t_name.equals(other.t_name))
			return false;
		if (t_pwd == null) {
			if (other.t_pwd != null)
				return false;
		} else if (!t_pwd.equals(other.t_pwd))
			return false;
		if (t_sex == null) {
			if (other.t_sex != null)
				return false;
		} else if (!t_sex.equals(other.t_sex))
			return false;
		if (t_tel == null) {
			if (other.t_tel != null)
				return false;
		} else if (!t_tel.equals(other.t_tel))
			return false;
		return true;
	}
	public String getT_tel() {
		return t_tel;
	}
	public void setT_tel(String t_tel) {
		this.t_tel = t_tel;
	}
	public String getT_mail() {
		return t_mail;
	}
	public void setT_mail(String t_mail) {
		this.t_mail = t_mail;
	}
	public String getT_card() {
		return t_card;
	}
	public void setT_card(String t_card) {
		this.t_card = t_card;
	}
}
