package com.bbs.service.impl;

import com.bbs.mapper.CustomerMapper;
import com.bbs.model.Customer;
import com.bbs.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.bbs.service.impl
 * ClassName:     CustomerServiceImpl
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 06 10 26
 **/

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerMapper custMapper;


    @Override
    public Customer customersLogin(String account, String password) {
        return custMapper.selectedCustomers(account,password);
    }

    @Override
    public List<Customer> selectByAccount(String account, String tel) {
        return custMapper.selectByAccount(account, tel);
    }

    @Override
    public int delete(int cid) {
        return custMapper.delete(cid);
    }

    @Override
    public int insert(Customer customer) {
        return custMapper.insert(customer);
    }

    @Override
    public Customer customerById(int cid) {
        return custMapper.customerById(cid);
    }

    @Override
    public int update(Customer customer) {
        return custMapper.update(customer);
    }
}
