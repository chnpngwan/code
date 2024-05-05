/**
 * @author Chnpng Wng
 * @data Apr 19, 2023
 * @time 11:09:39 AM
 */
package com.customer.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.customer.mapper.CustomerMapper;
import com.customer.model.Customer;
import com.customer.service.CustomerService;
@Service
public class CustomerServiceImpl implements CustomerService{
	
	@Resource
	private CustomerMapper customerMapper;
	@Override
	public List<Customer> selectList(Integer customerId,String customerName) {
		return customerMapper.selectList(customerId,customerName);
	}

	@Override
	public int insertCustomer(Customer customer) {
	 return customerMapper.insertCustomer(customer);
	}

	@Override
	public int deleteCustomer(Integer customerId) {
		return customerMapper.deleteCustomer(customerId);
	}

	@Override
	public List<Customer> queryCustomerById(Integer customerId) {
		return customerMapper.queryCustomerById(customerId);
	}

	@Override
	public int updateCustomer(Customer customer) {
		return customerMapper.updateCustomer(customer);
	}
}
