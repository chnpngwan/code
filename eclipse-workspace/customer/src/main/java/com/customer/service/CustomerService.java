/**
 * @author Chnpng Wng
 * @data Apr 19, 2023
 * @time 11:09:04 AM
 */
package com.customer.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.customer.model.Customer;

public interface CustomerService {
	List<Customer> selectList(Integer customerId,String customerName);
	int insertCustomer(Customer customer);
	int deleteCustomer(Integer customerId);
	// 根据id查询客户信息
	List<Customer> queryCustomerById(Integer customerId);

		// 修改客户信息
	int updateCustomer(Customer customer);
}
