/**
 * @author Chnpng Wng
 * @data Apr 19, 2023
 * @time 10:55:22 AM
 */
package com.customer.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.customer.model.Customer;

public interface CustomerMapper {
	/*
	 * @Select("select * from tb_customer")
	 * 
	 * @Results(id = "customerMap" , value = {
	 * 
	 * @Result(column="customer_id", property="customerId"),
	 * 
	 * @Result(column="customer_name", property="customerName"),
	 * 
	 * @Result(column="user_name", property="userName"),
	 * 
	 * @Result(column="source", property="source"),
	 * 
	 * @Result(column="industry", property="industry"),
	 * 
	 * @Result(column="create_date", property="createDate") })
	 */
	List<Customer> selectList(@Param("customerId") Integer customerId,@Param("customerName") String customerName);
	int insertCustomer(Customer customer);
	int deleteCustomer(@Param("customerId") Integer customerId);
	// 根据id查询客户信息
	List<Customer> queryCustomerById(@Param("customerId") Integer customerId);

	// 修改客户信息
	int updateCustomer(Customer customer);
}
