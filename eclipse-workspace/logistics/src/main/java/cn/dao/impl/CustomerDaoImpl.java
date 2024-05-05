package cn.dao.impl;

import cn.dao.CustomerDao;
import cn.pojo.Customer;

import java.util.List;

public class CustomerDaoImpl extends BaseDao implements CustomerDao {
    @Override
    public int addCustomer(Customer customer) {
        String sql = "insert into customer (cid,cname,sex,phone,address) values (?,?,?,?,?)";
        return update(sql,customer.getCid(),customer.getCname(),customer.getSex(),customer.getPhone(),customer.getAddress());
    }

    @Override
    public int deleteCustomer(int cid) {
        String sql = "delete from customer where cid = ?";
        return update(sql,cid);
    }

    @Override
    public int updateCustomer(Customer customer) {
        String sql = "update customer set cname=?,sex=?,phone=?,address=? where cid=?";
        return update(sql,customer.getCname(),customer.getSex(),customer.getPhone(),customer.getAddress(),customer.getCid());
    }

    @Override
    public Customer queryCustomerById(int cid) {
        String sql = "select cid,cname,sex,phone,address from customer where cid = ?";
        return queryForOne(Customer.class,sql,cid);
    }

    @Override
    public List<Customer> queryCustomers() {
        String sql = "select cid,cname,sex,phone,address from customer";
        return queryForList(Customer.class,sql);
    }
}
