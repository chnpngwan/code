package cn.dao;

import cn.pojo.Customer;
import cn.pojo.Package;

import java.util.List;

public interface CustomerDao {
    public int addCustomer(Customer customer);

    public int deleteCustomer(int cid);

    public int updateCustomer(Customer customer);

    public Customer queryCustomerById(int cid);

    public List<Customer> queryCustomers();
}
