package com.student.bean;

public class CorseInfo {
	private Integer c_id;
	private Integer t_id;
	private String c_name;
	@Override
	public String toString() {
		return "CorseInfo [c_id=" + c_id + ", t_id=" + t_id + ", c_name=" + c_name + "]";
	}
	public Integer getC_id() {
		return c_id;
	}
	public void setC_id(Integer c_id) {
		this.c_id = c_id;
	}
	public Integer getT_id() {
		return t_id;
	}
	public void setT_id(Integer t_id) {
		this.t_id = t_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((c_id == null) ? 0 : c_id.hashCode());
		result = prime * result + ((c_name == null) ? 0 : c_name.hashCode());
		result = prime * result + ((t_id == null) ? 0 : t_id.hashCode());
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
		CorseInfo other = (CorseInfo) obj;
		if (c_id == null) {
			if (other.c_id != null)
				return false;
		} else if (!c_id.equals(other.c_id))
			return false;
		if (c_name == null) {
			if (other.c_name != null)
				return false;
		} else if (!c_name.equals(other.c_name))
			return false;
		if (t_id == null) {
			if (other.t_id != null)
				return false;
		} else if (!t_id.equals(other.t_id))
			return false;
		return true;
	}
}
