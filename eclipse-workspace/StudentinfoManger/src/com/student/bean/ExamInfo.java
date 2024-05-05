package com.student.bean;


public class ExamInfo {
	private String e_name;
	private String endtime;
	private String starttime;
	private Integer time;
	private Integer status;
	private Integer degree;
	private Integer degree1;
	@Override
	public String toString() {
		return "ExamInfo [e_name=" + e_name + ", endtime=" + endtime + ", starttime=" + starttime + ", time=" + time
				+ ", status=" + status + ", degree=" + degree + ", degree1=" + degree1 + "]";
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((degree == null) ? 0 : degree.hashCode());
		result = prime * result + ((degree1 == null) ? 0 : degree1.hashCode());
		result = prime * result + ((e_name == null) ? 0 : e_name.hashCode());
		result = prime * result + ((endtime == null) ? 0 : endtime.hashCode());
		result = prime * result + ((starttime == null) ? 0 : starttime.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((time == null) ? 0 : time.hashCode());
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
		ExamInfo other = (ExamInfo) obj;
		if (degree == null) {
			if (other.degree != null)
				return false;
		} else if (!degree.equals(other.degree))
			return false;
		if (degree1 == null) {
			if (other.degree1 != null)
				return false;
		} else if (!degree1.equals(other.degree1))
			return false;
		if (e_name == null) {
			if (other.e_name != null)
				return false;
		} else if (!e_name.equals(other.e_name))
			return false;
		if (endtime == null) {
			if (other.endtime != null)
				return false;
		} else if (!endtime.equals(other.endtime))
			return false;
		if (starttime == null) {
			if (other.starttime != null)
				return false;
		} else if (!starttime.equals(other.starttime))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (time == null) {
			if (other.time != null)
				return false;
		} else if (!time.equals(other.time))
			return false;
		return true;
	}

	public String getE_name() {
		return e_name;
	}

	public void setE_name(String e_name) {
		this.e_name = e_name;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getDegree() {
		return degree;
	}

	public void setDegree(int degree) {
		this.degree = degree;
	}

	public Integer getDegree1() {
		return degree1;
	}

	public void setDegree1(Integer degree1) {
		this.degree1 = degree1;
	}

	public void setTime(Integer time) {
		this.time = time;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public void setDegree(Integer degree) {
		this.degree = degree;
	}
	
}
