package cn.service;

import cn.pojo.Customer;
import cn.pojo.Package;

import java.util.List;

public interface CustomerService {
    public void addCustomer(Customer customer);

    public void deleteCustomerById(int cid);

    public void updateCustomer(Customer customer);

    public Customer queryCustomerById(int cid);

    public List<Customer> queryCustomers();
}
