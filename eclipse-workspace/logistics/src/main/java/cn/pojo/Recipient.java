package cn.pojo;

public class Recipient {
    private int rid;

    private String rname;
    
    private String img;

    private String sex;

    private String phone;

    private String address;

	public Recipient() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Recipient(int rid, String rname, String img, String sex, String phone, String address) {
		super();
		this.rid = rid;
		this.rname = rname;
		this.img = img;
		this.sex = sex;
		this.phone = phone;
		this.address = address;
	}

	@Override
	public String toString() {
		return "Recipient [rid=" + rid + ", rname=" + rname + ", img=" + img + ", sex=" + sex + ", phone=" + phone
				+ ", address=" + address + "]";
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

    
}
