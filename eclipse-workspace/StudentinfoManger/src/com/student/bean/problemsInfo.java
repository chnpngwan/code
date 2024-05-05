package com.student.bean;

public class problemsInfo {
	private Integer p_id;
	private String title;
	private String options1;
	private String options2;
	private String options3;
	private String options4;
	private String answer;
	private Integer degree;
	private String type;
	private String e_name;
	private String w_name;
	@Override
	public String toString() {
		return "problemsInfo [p_id=" + p_id + ", title=" + title + ", options1=" + options1 + ", options2=" + options2
				+ ", options3=" + options3 + ", options4=" + options4 + ", answer=" + answer + ", degree=" + degree
				+ ", type=" + type + ", e_name=" + e_name + ", w_name=" + w_name + "]";
	}
	public Integer getP_id() {
		return p_id;
	}
	public void setP_id(Integer p_id) {
		this.p_id = p_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getOptions1() {
		return options1;
	}
	public void setOptions1(String options1) {
		this.options1 = options1;
	}
	public String getOptions2() {
		return options2;
	}
	public void setOptions2(String options2) {
		this.options2 = options2;
	}
	public String getOptions3() {
		return options3;
	}
	public void setOptions3(String options3) {
		this.options3 = options3;
	}
	public String getOptions4() {
		return options4;
	}
	public void setOptions4(String options4) {
		this.options4 = options4;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Integer getDegree() {
		return degree;
	}
	public void setDegree(Integer degree) {
		this.degree = degree;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}

	public String getW_name() {
		return w_name;
	}
	public void setW_name(String w_name) {
		this.w_name = w_name;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((answer == null) ? 0 : answer.hashCode());
		result = prime * result + ((degree == null) ? 0 : degree.hashCode());
		result = prime * result + ((e_name == null) ? 0 : e_name.hashCode());
		result = prime * result + ((options1 == null) ? 0 : options1.hashCode());
		result = prime * result + ((options2 == null) ? 0 : options2.hashCode());
		result = prime * result + ((options3 == null) ? 0 : options3.hashCode());
		result = prime * result + ((options4 == null) ? 0 : options4.hashCode());
		result = prime * result + ((p_id == null) ? 0 : p_id.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
		result = prime * result + ((w_name == null) ? 0 : w_name.hashCode());
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
		problemsInfo other = (problemsInfo) obj;
		if (answer == null) {
			if (other.answer != null)
				return false;
		} else if (!answer.equals(other.answer))
			return false;
		if (degree == null) {
			if (other.degree != null)
				return false;
		} else if (!degree.equals(other.degree))
			return false;
		if (e_name == null) {
			if (other.e_name != null)
				return false;
		} else if (!e_name.equals(other.e_name))
			return false;
		if (options1 == null) {
			if (other.options1 != null)
				return false;
		} else if (!options1.equals(other.options1))
			return false;
		if (options2 == null) {
			if (other.options2 != null)
				return false;
		} else if (!options2.equals(other.options2))
			return false;
		if (options3 == null) {
			if (other.options3 != null)
				return false;
		} else if (!options3.equals(other.options3))
			return false;
		if (options4 == null) {
			if (other.options4 != null)
				return false;
		} else if (!options4.equals(other.options4))
			return false;
		if (p_id == null) {
			if (other.p_id != null)
				return false;
		} else if (!p_id.equals(other.p_id))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		if (w_name == null) {
			if (other.w_name != null)
				return false;
		} else if (!w_name.equals(other.w_name))
			return false;
		return true;
	}
	
}
