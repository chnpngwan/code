package com.bbs.mapper;

import com.bbs.model.Customer;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.bbs.mapper
 * ClassName:     CustomerMapper
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 06 10 15
 **/


public interface CustomerMapper {
    @Select("select * from t_cust where account=#{account} and password=#{password}")
    Customer selectedCustomers(@Param("account") String account,@Param("password") String password);

    List<Customer> selectByAccount(@Param("account") String account,@Param("tel") String tel);
    @Delete("delete from t_cust where cid=#{cid}")
    public int delete(@Param("cid") int cid);
    @Insert("insert into t_cust(account,nickName,password,tel,code,level) values(#{account},#{nickName},#{password},#{tel},#{code},#{level}) ")
    public int insert(Customer customer);
    @Select("select * from t_cust where cid=#{cid}")
    public Customer customerById(@Param("cid") int cid);
    @Update("update t_cust set account=#{account},nickName=#{nickName},password=#{password},tel=#{tel} where cid=#{cid}")
    public int update(Customer customer);
}
