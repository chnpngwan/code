package com.bbs.service;

import com.bbs.model.Customer;

import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.bbs.service
 * ClassName:     CustomerService
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 06 10 26
 **/


public interface CustomerService {
    public Customer customersLogin(String account,String password);
    public List<Customer> selectByAccount(String account,String tel);
    public int delete(int cid);
    public int insert(Customer customer);
    public Customer customerById(int cid);
    public int update(Customer customer);
}
