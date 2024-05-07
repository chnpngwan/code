package com.car.user.dao;

import com.car.bus.domain.Customer;
import com.car.bus.domain.Rent;
import com.car.user.entity.BusCar;
import com.car.user.entity.TbUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * (TbUser)表数据库访问层
 */
public interface TbUserDao {


    int createRentNumber(String number);


    /**
     * 注册功能
     * @param username
     * @return
     */
    int registCheck(@Param("username") String username,@Param("password") String password_final,@Param("identity") String identity);
    /**
     * 登录功能
     * @param username
     * @return
     */
    TbUser loginCheck(String username);

    BusCar carByCarNumber(String carnmuber);

//
//
//    /**
//     * 通过ID查询单条数据
//     *
//     * @param id 主键
//     * @return 实例对象
//     */
   TbUser queryCustomerByIdentity(String identity);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BusCar> carAllByLimit(@Param("offset") int offset, @Param("limit") int limit);

    /**
     * 前端用户进行租车申请
     * @param rent
     * @return
     */
    int createRent(Rent rent);

    /**
     * 租车后减少用户余额
     * @param rent
     * @return
     */
    int downMoney(Rent rent);

    int createCustomer(Customer customer);

    int changeCarState(String carnumber);
}