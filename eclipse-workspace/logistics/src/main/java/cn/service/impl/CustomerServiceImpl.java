package cn.service.impl;

import cn.dao.CustomerDao;
import cn.dao.impl.CustomerDaoImpl;
import cn.pojo.Customer;
import cn.service.CustomerService;

import java.util.List;

public class CustomerServiceImpl implements CustomerService{

    private CustomerDao customerDao = new CustomerDaoImpl();

    @Override
    public void addCustomer(Customer customer) {
        customerDao.addCustomer(customer);
    }

    @Override
    public void deleteCustomerById(int cid) {
        customerDao.deleteCustomer(cid);
    }

    @Override
    public void updateCustomer(Customer customer) {
        customerDao.updateCustomer(customer);
    }

    @Override
    public Customer queryCustomerById(int cid) {
        return customerDao.queryCustomerById(cid);
    }


    @Override
    public List<Customer> queryCustomers() {
        return customerDao.queryCustomers();
    }
}
