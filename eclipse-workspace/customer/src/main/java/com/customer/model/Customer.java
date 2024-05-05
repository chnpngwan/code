/**
 * @author Chnpng Wng
 * @data Apr 19, 2023
 * @time 10:33:48 AM
 */
package com.customer.model;

import java.util.Date;

public class Customer {
	private int customerId;
	private String customerName;
	private String userName;
	private String source;
	private String industry;
	private Date createDate;
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Customer(int customerId, String customerName, String userName, String source, String industry,
			Date createDate) {
		super();
		this.customerId = customerId;
		this.customerName = customerName;
		this.userName = userName;
		this.source = source;
		this.industry = industry;
		this.createDate = createDate;
	}
	@Override
	public String toString() {
		return "Customer [customerId=" + customerId + ", customerName=" + customerName + ", userName=" + userName
				+ ", source=" + source + ", industry=" + industry + ", createDate=" + createDate + "]";
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}
